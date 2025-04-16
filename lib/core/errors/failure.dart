import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "Connection timeout occurred");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout occurred");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive timeout occurred");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Bad certificate error");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "Connection error occurred");
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: "Unknown error occurred");
    }
  }
  factory ServerFailure.fromResponse(Response? response) {
    if (response != null) {
      switch (response.statusCode) {
        case 400:
          return ServerFailure(errorMessage: "Bad request error");
        case 401:
          return ServerFailure(errorMessage: "Unauthorized access");
        case 403:
          return ServerFailure(errorMessage: "Forbidden access");
        case 404:
          return ServerFailure(errorMessage: "Resource not found");
        case 500:
          return ServerFailure(errorMessage: "Internal server error");
        default:
          return ServerFailure(
              errorMessage: "Received invalid status code: ${response.statusCode}");
      }
    } else {
      return ServerFailure(errorMessage: "No response received from server");
    }
  }
}
