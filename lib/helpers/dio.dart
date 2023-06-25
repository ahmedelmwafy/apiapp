// ignore_for_file: unnecessary_null_comparison, always_declare_return_types
import 'dart:developer';
import 'dart:io';
import 'package:apiapp/helpers/shared.dart';
import 'package:apiapp/widgets/toast.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://csregypt.net/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 130),
        receiveTimeout: const Duration(seconds: 130),
      ),
    );
    dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  static Future<Response?> getData({
    path,
    queryParameters,
  }) async {
    try {
      return await dio!.get(path,
          queryParameters: queryParameters,
          options: Options(
              validateStatus: (_) => true,
              headers: CashedHelper.getUserToken() != null ||
                      CashedHelper.getUserToken() != ''
                  ? {
                      'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
                      'Accept': 'application/json',
                      'lang': CashedHelper.getLang()
                    }
                  : {'lang': CashedHelper.getLang()}));
    } on SocketException catch (e) {
      log(e.message);
      customToast(e.message);
    } on DioException catch (e) {
      log(e.message.toString());
      String errorMsg = _handleResponse(e.response!);
      customToast(errorMsg);
    }
    return null;
  }

  static Future<Response?> postData({
    path,
    data,
    bool showError = false,
    queryParameters,
  }) async {
    try {
      return await dio!.post(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            contentType: 'application/json',
            headers: CashedHelper.getUserToken() != null ||
                    CashedHelper.getUserToken() != ''
                ? {
                    'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
                    'Accept': 'application/json',
                    'lang': CashedHelper.getLang()
                  }
                : {'lang': CashedHelper.getLang()},
            followRedirects: false,
          ));
    } on SocketException catch (e) {
      log(e.message);
      customToast(e.message);
    } on DioException catch (e) {
      customToast(e.response!.data['message'].toString());
    }
    return null;
  }

  static Future<Response?> deleteRequest({
    path,
    queryParameters,
  }) async {
    try {
      return await dio!.delete(path,
          queryParameters: queryParameters,
          options: Options(
              validateStatus: (_) => true,
              headers: CashedHelper.getUserToken() != null ||
                      CashedHelper.getUserToken() != ''
                  ? {
                      'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
                      'Accept': 'application/json',
                      'lang': CashedHelper.getLang()
                    }
                  : {'lang': CashedHelper.getLang()}));
    } on SocketException catch (e) {
      log(e.message);
      customToast(e.message);
    } on DioException catch (e) {
      log(e.message.toString());
      String errorMsg = _handleResponse(e.response!);
      customToast(errorMsg);
    }
    return null;
  }

  static Future<Response?> patchRequest({
    path,
    queryParameters,
  }) async {
    try {
      return await dio!.patch(path,
          queryParameters: queryParameters,
          options: Options(
              validateStatus: (_) => true,
              headers: CashedHelper.getUserToken() != null ||
                      CashedHelper.getUserToken() != ''
                  ? {
                      'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
                      'Accept': 'application/json',
                      'lang': CashedHelper.getLang()
                    }
                  : {'lang': CashedHelper.getLang()}));
    } on SocketException catch (e) {
      log(e.message);
      customToast(e.message);
    } on DioException catch (e) {
      log(e.message.toString());
      String errorMsg = _handleResponse(e.response!);
      customToast(errorMsg);
    }
    return null;
  }

  static Future<Response?> putRequest({
    path,
    data,
    queryParameters,
  }) async {
    try {
      return await dio!.put(path,
          queryParameters: queryParameters,
          data: data,
          options: Options(
              validateStatus: (_) => true,
              headers: CashedHelper.getUserToken() != null ||
                      CashedHelper.getUserToken() != ''
                  ? {
                      'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
                      'Accept': 'application/json',
                      'lang': CashedHelper.getLang()
                    }
                  : {'lang': CashedHelper.getLang()}));
    } on SocketException catch (e) {
      log(e.message);
      customToast(e.message);
    } on DioException catch (e) {
      log(e.message.toString());
      String errorMsg = _handleResponse(e.response!);
      customToast(errorMsg);
    }
    return null;
  }

  static String _handleResponse(Response response) {
    if (response == null) {
      var jsonResponse = 'connection error';
      return jsonResponse;
    }
    switch (response.statusCode) {
      case 400:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 401:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 403:
        var jsonResponse = 'UnAuth';
        return jsonResponse;
      case 404:
        var jsonResponse = 'Not found';
        return jsonResponse;
      case 405:
        var jsonResponse = 'post request replaced by get request';
        return jsonResponse;
      case 422:
        var jsonResponse = 'some fileds required! or error with entry data';
        return jsonResponse;
      case 500:
        var jsonResponse = 'server error';
        return jsonResponse;
      default:
        var jsonResponse = 'server error';
        return jsonResponse;
    }
  }
}
