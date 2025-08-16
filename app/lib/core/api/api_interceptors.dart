import 'package:app/core/service/cache_service.dart';
import 'package:dio/dio.dart';
import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheService().getData(key: StorageKeys.token);
    options.headers['Content-Type'] = 'application/json';
    options.headers[ApiKey.authorization] = token != null ? 'Bearer $token' : null;
    // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NDJmM2M2ZGZiNDAwNjRmMmNhZGRkMiIsImlhdCI6MTc0OTI5NDQyOH0.dB3U4izjI_kdNqPzv_A86OdRAgI29WM4nmJIqGQdE9k";
    super.onRequest(options, handler);
  }
}
