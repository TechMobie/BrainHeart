import 'package:get/get_utils/src/extensions/string_extensions.dart';

class ValidationUtils {
  static bool isStingEmpty(String string) {
    return string.trim().isEmpty ? true : false;
  }

  static bool validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = RegExp(patttern);
    if (isStingEmpty(value)) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return (!RegExp(pattern).hasMatch(value)) ? false : true;
  }
}

extension Extensions on String {
  String truncate0to5String() {
    final int length = this.length;
    String result = this;

    if (length > 14) {
      result = "${substring(0, 5)}...${substring(length - 4)}";
    }

    return result;
  }

  String truncateString() {
    final int length = this.length;
    String result = this;

    if (length > 20) {
      result = "${substring(0, 15)}...${substring(length - 4)}";
    }

    return result;
  }

  String get capitalizeFirstofEach =>
      (split(" ").map((str) => str.capitalize).join(""))
          .replaceFirst(this[0], this[0].toLowerCase());

  String get firstLetterCapital =>
      this[0].toString().toUpperCase() + substring(1);
}

extension Ex on double {
  String toStringAsFixedNoZero(int n) =>
      double.parse(toStringAsFixed(n)).toString();
}
