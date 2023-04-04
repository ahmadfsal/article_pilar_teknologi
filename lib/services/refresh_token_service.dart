import 'package:article_pilar_teknologi/app.dart';
import 'package:article_pilar_teknologi/helper/constant_name_helper.dart';
import 'package:article_pilar_teknologi/helper/constant_url_helper.dart';
import 'package:article_pilar_teknologi/helper/setting_toast_helper.dart';
import 'package:dio/dio.dart';

class RefreshTokenService {
  String? currentToken = App().sharedPreferences.getString(ConstantNameHelper.userKeyToken);

  Future<String?> doRefreshToken() async {
    try {
      Dio dio = Dio(BaseOptions(
          baseUrl: ConstantUrlHelper.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          contentType: 'application/json',
          responseType: ResponseType.json));

      Response response = await dio.post(
          ConstantUrlHelper.postRefreshToken,
          options: Options(
              headers: {
                'Authorization': 'Bearer $currentToken'
              }
          )
      );

      if (response.data['status']) {
        return response.data['data']['token'];
      }

      return null;
    } on DioError catch (err) {
      showFlutterToast(err.response?.data['message']);
      return null;
    }
  }
}