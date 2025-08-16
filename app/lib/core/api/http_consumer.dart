// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../errors/exceptions.dart';
// import 'api_consumer.dart';

// class HttpConsumer extends ApiConsumer {
//   final http.Client client;
//   final String baseUrl;

//   HttpConsumer({required this.client, required this.baseUrl});

//   @override
//   Future<dynamic> delete(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     bool isFromData = false,
//   }) async {
//     try {
//       final uri = _buildUri(path, queryParameters);
//       final headers = await _getHeaders();
//       final response = await client.delete(
//         uri,
//         headers: headers,
//         body: isFromData ? _convertToFormData(data) : jsonEncode(data),
//       );
      
//       return _handleResponse(response);
//     } catch (e) {
//       _handleExceptions(e);
//     }
//   }

//   @override
//   Future<dynamic> get(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final uri = _buildUri(path, queryParameters);
//       final headers = await _getHeaders();
      
//       final response = await client.get(
//         uri,
//         headers: headers,
//       );
      
//       return _handleResponse(response);
//     } catch (e) {
//       _handleExceptions(e);
//     }
//   }

//   @override
//   Future<dynamic> patch(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     bool isFromData = false,
//   }) async {
//     try {
//       final uri = _buildUri(path, queryParameters);
//       final headers = await _getHeaders();
      
//       final response = await client.patch(
//         uri,
//         headers: headers,
//         body: isFromData ? _convertToFormData(data) : jsonEncode(data),
//       );
      
//       return _handleResponse(response);
//     } catch (e) {
//       _handleExceptions(e);
//     }
//   }

//   @override
//   Future<dynamic> post(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     bool isFromData = false,
//   }) async {
//     try {
//       final uri = _buildUri(path, queryParameters);
//       final headers = await _getHeaders();
      
//       final response = await client.post(
//         uri,
//         headers: headers,
//         body: isFromData ? _convertToFormData(data) : jsonEncode(data),
//       );
      
//       return _handleResponse(response);
//     } catch (e) {
//       _handleExceptions(e);
//     }
//   }

//   Uri _buildUri(String path, Map<String, dynamic>? queryParameters) {
//     return Uri.parse('$baseUrl$path').replace(
//       queryParameters: queryParameters,
//     );
//   }

//   Future<Map<String, String>> _getHeaders() async {
//     // Add your common headers here (e.g., authorization)
//     return {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//     };
//   }

//   dynamic _handleResponse(http.Response response) {
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       return jsonDecode(response.body);
//     } else {
//       throw ServerException(
//         message: 'Server error',
//         statusCode: response.statusCode,
//       );
//     }
//   }

//   void _handleExceptions(dynamic error) {
//     if (error is ServerException) {
//       throw error;
//     } else {
//       throw ServerException( message: error.toString());
//     }
//   }

//   String _convertToFormData(Object? data) {
//     if (data is Map<String, dynamic>) {
//       return data.entries
//           .map((entry) => '${entry.key}=${Uri.encodeComponent(entry.value.toString())}')
//           .join('&');
//     }
//     return data.toString();
//   }
// }