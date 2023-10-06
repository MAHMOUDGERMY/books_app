import 'package:dio/dio.dart';

abstract class Failure {
  final message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connection timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure("send Timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive Timeout");
      case DioExceptionType.badCertificate:
        return ServerFailure("bad Certificate");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("cancel");
      case DioExceptionType.connectionError:
        return ServerFailure("connection Error");
      case DioExceptionType.unknown:
        return ServerFailure("unknown Error");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("your request was not found , please try later");
    } else if (statusCode == 500) {
      return ServerFailure(
          "There is a problem with serever , please try later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    }
    return ServerFailure("there was an error , please try again");
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
