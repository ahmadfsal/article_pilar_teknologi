import 'package:fluttertoast/fluttertoast.dart';

void showFlutterToast(
  String message, {
  ToastGravity gravity = ToastGravity.BOTTOM,
  Toast toastLength = Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
      msg: message, toastLength: toastLength, gravity: gravity, fontSize: 16.0);
}