import 'package:dio/dio.dart';
import 'error_marketi_model.dart';

abstract class AppException implements Exception {
  final ErrorMarketiModel errModel;
  const AppException(this.errModel);
}

class ServerException extends AppException {
  ServerException(super.errModel);
}

class NetworkException extends AppException {
  NetworkException(super.errModel);
}

class CacheException extends AppException {
  CacheException(super.errModel);
}

class NotFoundException extends CacheException {
  NotFoundException(super.errModel);
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
        case 401:
          throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
        case 403:
          throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
        case 404:
          throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
        case 409:
          throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
        case 422:
          throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
        case 504:
          throw ServerException(ErrorMarketiModel.fromJson(e.response!.data));
      }
  }
}
