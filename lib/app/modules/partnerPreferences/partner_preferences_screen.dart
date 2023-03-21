// ignore_for_file: depend_on_referenced_packages

import 'package:brain_heart/app/modules/partnerPreferences/partner_preferences_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/button/save_button.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/helper/utils/constants.dart';
import 'package:brain_heart/helper/utils/enum_utils.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/helper/utils/pref_utils.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PartnerPreferencesScreen extends StatelessWidget {
  PartnerPreferencesScreen({Key? key}) : super(key: key);
  final PartnerPreferencesController _partnerPreferencesController =
      Get.put<PartnerPreferencesController>(PartnerPreferencesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonHeader(
                  title: "Partner preferences",
                  isShowBackIcon: true,
                  isShowCancel: (isFromRegister) ? false : true,
                  cancelOnTap: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(Routes.bottomBarScreen));
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          _genderWidget(),
                          _ageWidget(),
                          _distanceWidget(),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SaveButton(
              title: (isFromRegister) ? "Complete" : "Save",
              onTap: () {
                if (isFromRegister) {
                  PrefUtils.getInstance.writeData(
                      PrefUtils.getInstance.accessToken, "userLoggedIn");
                  Get.offAllNamed(Routes.bottomBarScreen);
                } else {
                  Get.back();
                }
              },
              buttonType: ButtonType.enable,
            ),
          ),
        ],
      ),
    );
  }

  Column _ageWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Divider(
          color: ColorSchema.dark1.withOpacity(0.1),
          height: 0,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Age Range",
          style: const TextStyle()
              .normal12
              .textColor(ColorSchema.dark1.withOpacity(0.5)),
        ),
        Obx(
          () => SizedBox(
            height: 25,
            child: SfSliderTheme(
              data: SfRangeSliderThemeData(
                thumbRadius: 34,
                trackCornerRadius: 0,
                // thumbStrokeWidth: 4,
                // thumbStrokeColor: ColorConstants.whiteColor,

                activeTrackHeight: 2,
                inactiveTrackHeight: 2,
                // thumbStrokeWidth: 15,

                thumbColor: Colors.transparent,
                // thumbColor: (widget.value == 0)
                //     ? ColorConstants.questionBackgroundColor
                //     : ColorConstants.primaryColor,
              ),
              child: SfRangeSlider(
                interval: 1,
                values: _partnerPreferencesController.values.value,
                endThumbIcon: Container(
                  margin: const EdgeInsets.all(4.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorSchema.whiteColor),
                ),
                startThumbIcon: Container(
                  margin: const EdgeInsets.all(4.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorSchema.whiteColor),
                ),
                min: 0,
                dragMode: SliderDragMode.onThumb,
                max: 100.0,
                activeColor: ColorSchema.primaryColor,
                inactiveColor: ColorSchema.primaryColor.withOpacity(0.1),
                onChanged: (val) {
                  _partnerPreferencesController.values.value = val;
                },
              ),
            ),
          ),
        ),
        Obx(
          () => Row(
            children: [
              Text(
                _partnerPreferencesController.values.value.start
                    .toInt()
                    .toString(),
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
              const Spacer(),
              Text(
                _partnerPreferencesController.values.value.end
                    .toInt()
                    .toString(),
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _distanceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Divider(
          color: ColorSchema.dark1.withOpacity(0.1),
          height: 0,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Max distance (km)",
          style: const TextStyle()
              .normal12
              .textColor(ColorSchema.dark1.withOpacity(0.5)),
        ),
        Obx(
          () => SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: SfSliderTheme(
                data: SfSliderThemeData(
                  thumbRadius: 14,
                  // thumbStrokeWidth: 4,
                  // thumbStrokeColor: ColorConstants.whiteColor,
                  activeDividerStrokeWidth: 0,
                  inactiveDividerStrokeWidth: 0,
                  trackCornerRadius: 0,

                  activeTrackHeight: 5,
                  inactiveTrackHeight: 5,
                  thumbColor: Colors.transparent,
                  // thumbColor: (widget.value == 0)
                  //     ? ColorConstants.questionBackgroundColor
                  //     : ColorConstants.primaryColor,
                ),
                child: SfSlider(
                  value: _partnerPreferencesController.distance.value,
                  interval: 1,
                  thumbIcon: Container(
                    margin: const EdgeInsets.all(6.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorSchema.whiteColor),
                  ),
                  min: 0,
                  activeColor: ColorSchema.primaryColor,
                  inactiveColor: ColorSchema.primaryColor.withOpacity(0.1),
                  max: 100.0,
                  onChanged: (val) {
                    _partnerPreferencesController.distance.value = val;
                  },
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => Text(
            _partnerPreferencesController.distance.value.toInt().toString(),
            style: const TextStyle().normal14.textColor(ColorSchema.dark1),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column _genderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: const TextStyle()
              .normal12
              .textColor(ColorSchema.dark1.withOpacity(0.5)),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  _partnerPreferencesController.gender.value = Gender.male;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: (_partnerPreferencesController.gender.value ==
                                  Gender.male)
                              ? ColorSchema.primaryColor
                              : ColorSchema.dark1)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: (_partnerPreferencesController.gender.value ==
                              Gender.male)
                          ? ColorSchema.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(ImageConstants.maleIcon),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Male",
              style: const TextStyle().normal18.textColor(ColorSchema.dark1),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  _partnerPreferencesController.gender.value = Gender.female;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: (_partnerPreferencesController.gender.value ==
                                  Gender.female)
                              ? ColorSchema.primaryColor
                              : ColorSchema.dark1)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: (_partnerPreferencesController.gender.value ==
                              Gender.female)
                          ? ColorSchema.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(ImageConstants.femaleIcon),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Female",
              style: const TextStyle().normal18.textColor(ColorSchema.dark1),
            )
          ],
        ),
      ],
    );
  }
}
