import 'package:dio/dio.dart';

import '../../tl_flutter_openai.dart';
import '../config/constants.dart';
import '../models/models.dart';
import '../util/log.dart';
import 'main_interceptor.dart';

class Api {
  Api({
    required this.apiKey,
    this.organizationId,
    this.projectId,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: openAiBaseUrl,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
          if (organizationId != null) 'OpenAI-Organization': '$organizationId',
          if (projectId != null) 'OpenAI-Project': '$projectId',
        },
      ),
    );
    _dio.interceptors.add(MainInterceptor());
  }

  final String apiKey;
  final String? organizationId;
  final String? projectId;
  late final Dio _dio;

  Future<ChatCompletion> createChatCompletion(ChatCompletionRequest request) async {
    final response = await _post(
      'chat/completions',
      body: request.toJson(),
    );
    return ChatCompletion.fromJson(response ?? {});
  }

  //
  Future<dynamic> _get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(
        '/$path',
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      // l('_get', '---------------------------------');
      // l('_get', 'error - error:    ${e.error}');
      // l('_get', 'error - type:     ${e.error.runtimeType}');
      // l('_get', 'error - type dio: ${e.type}');
      // l('_get', '---------------------------------');
      throw e.message.toString();
    }
  }

  Future<Map<String, dynamic>?> _post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.post(
        '/$path',
        data: body,
      );
      return response.data ?? {};
    } on DioException catch (e) {
      if (e.response?.data is String) {
        throw e.message.toString();
      } else {
        throw e.response?.data['errorMsg'] ?? e.message;
      }
    }
  }

  Future<Map<String, dynamic>> _delete(String path) async {
    try {
      final response = await _dio.delete('/$path');
      l('_delete', response);
      return response.data ?? {};
    } on DioException catch (e) {
      l('_delete', 'dio error - ${e.message}');
      throw e.message.toString();
    }
  }

  Future<Map<String, dynamic>> _put(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.put(
        '/$path',
        data: body,
      );
      return response.data ?? {};
    } on DioException catch (e) {
      l('_put', 'dio error - ${e.message}');
      throw e.message.toString();
    }
  }

  Future<Map<String, dynamic>> _patch(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.patch(
        '/$path',
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      l('_patch', 'dio error - ${e.message}');
      throw e.message.toString();
    }
  }
}
