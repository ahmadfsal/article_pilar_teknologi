import 'package:article_pilar_teknologi/helper/constant_name_helper.dart';
import 'package:article_pilar_teknologi/helper/constant_url_helper.dart';
import 'package:article_pilar_teknologi/services/refresh_token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App {
  static App? _instance;
  final String? appTitle;
  late SharedPreferences sharedPreferences;
  late Dio dio;

  App.configure({required this.appTitle}) {
    _instance = this;
  }

  factory App() {
    if (_instance == null) {
      throw UnimplementedError('App must be configured first.');
    }
    return _instance!;
  }

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    dio = Dio(BaseOptions(
        baseUrl: ConstantUrlHelper.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
        responseType: ResponseType.json));

    dio.interceptors.addAll([
      RefreshTokenInterceptor(),
    ]);
  }

  void setDioHeader() {
    String? token = sharedPreferences.getString(ConstantNameHelper.userKeyToken);
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
  }
}
