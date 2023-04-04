import 'package:article_pilar_teknologi/app.dart';
import 'package:article_pilar_teknologi/helper/constant_name_helper.dart';
import 'package:article_pilar_teknologi/helper/global_method_helper.dart';
import 'package:article_pilar_teknologi/helper/setting_toast_helper.dart';
import 'package:article_pilar_teknologi/services/refresh_token_service.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RefreshTokenInterceptor extends Interceptor {
  @override
  void onError(DioError e, ErrorInterceptorHandler handler) async {
    if (e.response?.statusCode == 500) {
      RequestOptions options = e.response!.requestOptions;
      print(e.response!.data);
      // Map<String, dynamic> data = e.response!.data;
      // switch (data["message"]) {
      //   case 'ConstantNameHelper.msgExpiredToken':
      //     RefreshTokenService refreshTokenService = RefreshTokenService();
      //     String? newToken = await refreshTokenService.doRefreshToken();
      //     if (!GlobalMethodHelper.isEmpty(newToken)) {
      //       final header = options.headers;
      //       header['Authorization'] = 'Bearer $newToken';
      //       final newOption = options.copyWith(headers: header);
      //       App().sharedPreferences.setString(
      //             ConstantNameHelper.userKeyToken,
      //             newToken!,
      //           );
      //       App().setDioHeader();

      //       handler.resolve(
      //         await App().dio.request(
      //               options.path,
      //               queryParameters: options.queryParameters,
      //               data: options.data,
      //               options: Options(
      //                 method: options.method,
      //                 headers: newOption.headers,
      //               ),
      //             ),
      //       );
      //     } else {
      //       return handler.next(e);
      //     }
      //     break;
      //   default:
      //     showFlutterToast('Terjadi kesalahan');
          return handler.next(e);
      // }
    } else if (e.type == DioErrorType.connectionError ||
        e.type == DioErrorType.connectionError) {
      showFlutterToast(
        'Connection Timeout',
        toastLength: Toast.LENGTH_LONG,
      );
      return handler.next(e);
    } else {
      handler.next(e);
    }
  }
}
