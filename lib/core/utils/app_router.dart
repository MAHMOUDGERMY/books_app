import 'package:books_app/Features/home/presntation/views/book_details_view.dart';
import 'package:books_app/Features/home/presntation/views/home_view.dart';
import 'package:books_app/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KhomeView = '/homeView';
  static const KBookDetailsView = '/BookDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KhomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
