import 'package:brain_heart/app/modules/splash/splash_controller.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashController splashController =
      Get.put<SplashController>(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchema.primaryColor,
      body: Center(
        child: SvgPicture.asset(ImageConstants.splash),
      ),
    );
  }
}
