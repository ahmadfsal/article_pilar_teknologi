import 'package:intl/intl.dart';

class GlobalMethodHelper {
  static String currentDay() {
    DateTime dateTime = DateTime.now();
    return DateFormat('EEEE').format(dateTime).toString();
  }

  static String currentDate() {
    DateTime dateTime = DateTime.now();
    return DateFormat('dd MMM yyyy').format(dateTime).toString();
  }

  static bool isEmpty(text) {
    if (text == null ||
        text == "" ||
        text == 0 ||
        text == "0" ||
        text == "null") {
      return true;
    } else {
      return false;
    }
  }

  static bool isEmptyList(Iterable<dynamic>? list) {
    if (list == null) {
      return true;
    } else if (list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static String formatDateDigitalPrint(String dateTime) {
    String output = DateFormat('dd MMMM yyyy').format(DateTime.parse(dateTime));
    return output;
  }

  static String timeAgoSinceDate(String? dateTime) {
    DateTime formatDateFromApi = DateTime.parse(dateTime!).toLocal();
    DateTime currentDate = DateTime.now().toLocal();
    Duration difference = currentDate.difference(formatDateFromApi);

    if (difference.inSeconds < 5) {
      return 'Baru saja';
    } else if (difference.inSeconds <= 60) {
      return '${difference.inSeconds} detik lalu';
    } else if (difference.inMinutes <= 1) {
      return '1 menit lalu';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes} menit lalu';
    } else if (difference.inHours <= 1) {
      return '1 jam lalu';
    } else if (difference.inHours <= 60) {
      return '${difference.inHours} jam lalu';
    } else if (difference.inDays <= 1) {
      return '1 hari lalu';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays} hari lalu';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return '1 minggu lalu';
    } else if ((difference.inDays / 7).ceil() <= 4) {
      return '${(difference.inDays / 7).ceil()} minggu lalu';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return '1 bulan lalu';
    } else if ((difference.inDays / 30).ceil() <= 30) {
      return '${(difference.inDays / 30).ceil()} bulan lalu';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return '1 tahun lalu';
    }
    return '${(difference.inDays / 365).floor()} tahun lalu';
  }

  static String getInitialName({required String text}) {
    var buffer = StringBuffer();
    var split = text.split(' ');
    for (var i = 0; i < split.length; i++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString().toUpperCase();
  }

  static String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (value!.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!regex.hasMatch(value)) {
      return 'Email tidak valid';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[*@!∆¶×÷π√•|`~£¢€¥^°=}{✓™®©%<>%@#$_&\-+()/?!;:\"/\]/\[/.,\u0027]).{8,}$';
    RegExp regex = RegExp(pattern as String);
    if (value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.contains(' ')) {
      return 'Password tidak boleh menggunakan karakter spasi';
    } else if (value.length < 8) {
      return 'Password diisi minimal 8 karakter';
    } else if (value.isNotEmpty && !regex.hasMatch(value)) {
      return 'Password harus berisi huruf besar, huruf kecil, angka dan simbol';
    } else {
      return null;
    }
  }
}
