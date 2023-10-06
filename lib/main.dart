import 'package:books_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:books_app/Features/home/domain/entities/book_entity.dart';
import 'package:books_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:books_app/Features/home/presntation/manager/feautred_books_cubit/feautred_book_cubit.dart';
import 'package:books_app/constants.dart';
import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'Features/home/presntation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'core/functions/setup_service_locator.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Future.wait([
    Hive.openBox<BookEntity>(KFeaturedBox),
    Hive.openBox<BookEntity>(KNewestBox),
  ]);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeautredBookCubit(FetchFeaturedBooksUseCase(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ))
            ..fetchFeautredBooks();
        }),
        BlocProvider(create: (context) {
          return NewestBookCubit(FetchNewestBooksUseCase(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ));
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        title: 'Books App',
      ),
    );
  }
}
