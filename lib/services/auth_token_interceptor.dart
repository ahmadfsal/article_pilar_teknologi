import 'package:article_pilar_teknologi/app.dart';
import 'package:article_pilar_teknologi/helper/constant_name_helper.dart';
import 'package:dio/dio.dart';

class AuthTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //set new header with token
    final header = options.headers;
    header['Token'] = App().sharedPreferences.get(ConstantNameHelper.userKeyToken);
    final newOption = options.copyWith(headers: header);
    return handler.next(newOption);
  }
}
