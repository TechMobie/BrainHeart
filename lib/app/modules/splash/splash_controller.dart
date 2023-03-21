import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/helper/utils/pref_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (kDebugMode) {
        print(PrefUtils.getInstance
          .readData(PrefUtils.getInstance.accessToken)
          .toString());
      }
      if (PrefUtils.getInstance.readData(PrefUtils.getInstance.accessToken) !=
          null) {
        Get.offNamed(Routes.bottomBarScreen);
      } else {
        Get.offNamed(Routes.introScreen);
      }
    });
  }
}
