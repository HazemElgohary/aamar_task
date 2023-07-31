import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;


class DioWrapper {
  final Dio dio;

  DioWrapper(this.dio);

  Future<Response> _validate(Response res) async {
    if (res.statusCode == 500) {
      throw 'Server Error';
    }
    // else if (res.statusCode == 422) {
    //   throw 'ValidationException';
    // } else if (res.data == null) {
    //   throw 'api returned null response';
    // }
    return res;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    try {
      final res = await dio.get(path,
          queryParameters: query,
          options: Options(headers: {
            'ln': Get.locale == const Locale('en') ? 'en' : 'ar',
            ...headers,
          }),
          onReceiveProgress: (ds, sd) {});
      return _validate(res);
    } on DioException catch (e, st) {
      log(e.toString());
      log(st.toString());
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw 'please_check_your_connection'.tr;
      }
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    try {
      final res = await dio.post(
        path,
        data: body,
        queryParameters: query,
        options: Options(
          headers: {
            'ln': Get.locale == const Locale('en') ? 'en' : 'ar',
            ...headers,
          },
          contentType: contentType,
        ),
      );
      return _validate(res);
    } on DioException catch (e, st) {
      log(e.toString());
      log(st.toString());
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw 'please_check_your_connection'.tr;
      }
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    try {
      final res = await dio.put(
        path,
        data: body,
        queryParameters: query,
        options: Options(headers: {
          'ln': Get.locale == const Locale('en') ? 'en' : 'ar',
          ...headers,
        }),
      );
      return _validate(res);
    } on DioException catch (e, st) {
      log(e.toString());
      log(st.toString());
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw 'please check your connection'.tr;
      }
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    try {
      final res = await dio.delete(
        path,
        data: body,
        queryParameters: query,
        options: Options(
          headers: {
            'ln': Get.locale == const Locale('en') ? 'en' : 'ar',
            ...headers,
          },
        ),
      );
      return _validate(res);
    } on DioException catch (e, st) {
      log(e.toString());
      log(st.toString());
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw 'please_check_your_connection'.tr;
      }
      rethrow;
    }
  }
}

// Api facade
class Api {
  static DioWrapper get _client => Get.find<DioWrapper>();

  static Future<Response> get(
    String path, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    return _client.get(
      path,
      query: query,
      headers: headers,
      attachToken: attachToken,
    );
  }

  static Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    return _client.post(
      path,
      body: body,
      headers: headers,
      query: query,
      contentType: contentType,
      attachToken: attachToken,
    );
  }

  static Future<Response> put(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    return _client.put(
      path,
      body: body,
      headers: headers,
      query: query,
      attachToken: attachToken,
    );
  }

  static Future<Response> delete(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    return _client.delete(
      path,
      body: body,
      headers: headers,
      query: query,
    );
  }
}