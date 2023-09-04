// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tut_app/app/app_prefs.dart';
import 'package:tut_app/presentation/resources/language_manager.dart';

import '../../app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final LanguagePreferences _languagePreferences;
  DioFactory(this._languagePreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    final String? language = await _languagePreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: language ?? LanguageType.ENGLISH.getValue()
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: Duration(milliseconds: Constants.apiTimeOut),
    );

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
