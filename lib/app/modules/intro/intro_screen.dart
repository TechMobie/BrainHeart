import 'package:brain_heart/app/modules/intro/intro_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/helper/utils/common_functions.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/helper/utils/math_utils.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:brain_heart/schemata/text_style.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);
  final IntroController _introController =
      Get.put<IntroController>(IntroController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchema.offWhiteColor,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          _introImages(),
          _header(context),
          _introBottomWidget(context)
        ],
      ),
    );
  }

  Obx _introImages() {
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(Get.context!).size.height / 1.8,
        width: double.infinity,
        child: Image.asset(
          _introController
                  .introList[_introController.currentPage.value].image ??
              "",
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  Padding _header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MathUtilities.safeAreaTopHeight(context) +
            getHeightOfPerspactiveDevice(),
        left: 20,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Obx(
          () => (_introController.currentPage.value > 0)
              ? InkWell(
                  onTap: () {
                    if (_introController.currentPage.value > 0) {
                      _introController.currentPage.value--;
                    }
                  },
                  child: SvgPicture.asset(ImageConstants.backIcon),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  Align _introBottomWidget(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 28),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: ColorSchema.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Obx(() => Text(
                  _introController.introList[_introController.currentPage.value]
                          .title ??
                      "",
                  style:
                      const TextStyle().semiBold32.textColor(ColorSchema.dark1),
                )),
            const Spacer(),
            Obx(() => Text(
                  _introController.introList[_introController.currentPage.value]
                          .subTitle ??
                      "",
                  textAlign: TextAlign.center,
                  style: const TextStyle()
                      .normal18
                      .textColor(ColorSchema.dark1.withOpacity(0.7)),
                )),
            const Spacer(),
            _buttonAndIndicator()
          ],
        ),
      ),
    );
  }

  Row _buttonAndIndicator() {
    return Row(
      children: [
        Obx(() => DotsIndicator(
              dotsCount: 4,
              position: _introController.currentPage.value.toDouble(),
              axis: Axis.horizontal,
              decorator: DotsDecorator(
                color: ColorSchema.dark1.withOpacity(0.1),
                activeSize: const Size(50, 5),
                size: const Size(15, 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                spacing: const EdgeInsets.only(right: 5),
              ),
            )),
        const Spacer(),
        _button()
      ],
    );
  }

  Widget _button() {
    return SizedBox(
      width: MediaQuery.of(Get.context!).size.width / 3,
      child: Button(
        title: "Continue",
        buttonType: ButtonType.enable,
        onTap: () {
          if ((_introController.currentPage.value + 1) <
              _introController.introList.length) {
            _introController.currentPage.value++;
          } else {
            Get.offNamed(Routes.signInScreen);
          }
        },
      ),
    );
  }
}
