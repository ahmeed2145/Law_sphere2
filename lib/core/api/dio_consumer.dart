import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../secure/secure_storage_service.dart';
import 'api_consumer.dart';
import 'endpoints.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  final SecureStorageService secureStorageService;

  DioConsumer({required this.dio, required this.secureStorageService}) {
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (object) {
          if (object is FormData) {
            // Custom FormData logging
            debugPrint('FormData:');
            debugPrint('  Fields:');
            for (final field in object.fields) {
              debugPrint('    ${field.key}: ${field.value}');
            }
            debugPrint('  Files:');
            for (final file in object.files) {
              debugPrint(
                '    ${file.key}: ${file.value.filename} (${file.value.length} bytes)',
              );
            }
          } else {
            debugPrint(object.toString());
          }
        },
      ),
    );
    // Add to your Dio initialization
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('Sending request to ${options.uri}');
          debugPrint('Headers: ${options.headers}');

          if (options.data is FormData) {
            final formData = options.data as FormData;
            debugPrint('FormData fields: ${formData.fields}');

            // Enhanced file logging
            debugPrint('FormData files:');
            for (final file in formData.files) {
              debugPrint('  ${file.key}:');
              debugPrint('    filename: ${file.value.filename}');
              debugPrint('    length: ${file.value.length} bytes');
              debugPrint('    contentType: ${file.value.contentType}');
            }
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<Map<String, String>> _getHeaders({bool isFromData = false}) async {
    final token = await secureStorageService.getValue(ApiKey.token);
    return {
      if (token != null) 'Authorization': 'Bearer $token',
      if (!isFromData) 'Content-Type': 'application/json',
    };
  }

  Future<Map<String, String>> _getPublicHeaders({
    bool isFromData = false,
  }) async {
    return {if (!isFromData) 'Content-Type': 'application/json'};
  }

  void handleDioExceptions(DioException e) {
    log('Dio error: ${e.message}');
    throw e;
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final headers = await _getHeaders(isFromData: isFromData);
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: isFromData ? 'multipart/form-data' : 'application/json',
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final headers = await _getHeaders();
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final headers = await _getHeaders(isFromData: isFromData);
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: isFromData ? 'multipart/form-data' : 'application/json',
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final headers = path.contains(Endpoints.login)
          ? await _getPublicHeaders(isFromData: isFromData)
          : await _getHeaders(isFromData: isFromData);

      dynamic requestData;
      if (isFromData) {
        requestData = data is FormData ? data : FormData.fromMap(data);
      } else {
        requestData = jsonEncode(data);
      }

      final response = await dio.post(
        path,
        data: requestData,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: isFromData ? 'multipart/form-data' : 'application/json',
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final headers = await _getHeaders(isFromData: isFormData);
      final requestData = isFormData
          ? (data is FormData ? data : FormData.fromMap(data))
          : jsonEncode(data);

      final response = await dio.put(
        path,
        data: requestData,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: isFormData ? 'multipart/form-data' : 'application/json',
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
