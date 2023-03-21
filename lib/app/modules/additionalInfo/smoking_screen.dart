import 'package:brain_heart/app/modules/additionalInfo/additional_info_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/button/save_button.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/helper/utils/constants.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmokingScreen extends StatelessWidget {
  SmokingScreen({Key? key}) : super(key: key);
  final AdditionalInfoController _additionalInfoController =
      Get.find<AdditionalInfoController>();
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
                  title: "Smoking",
                  isShowBackIcon: true,
                  isShowCancel: (isFromRegister) ? false : true,
                  cancelOnTap: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(Routes.bottomBarScreen));
                  },
                ),
                ListView.separated(
                  itemCount: _additionalInfoController.alcoholList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 50),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          _additionalInfoController.smokingCurrentIndex.value =
                              index;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _additionalInfoController.alcoholList[index],
                              style: const TextStyle()
                                  .normal18
                                  .textColor(ColorSchema.dark1),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: (_additionalInfoController
                                                  .smokingCurrentIndex.value ==
                                              index)
                                          ? ColorSchema.primaryColor
                                          : ColorSchema.dark1)),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: (_additionalInfoController
                                              .smokingCurrentIndex.value ==
                                          index)
                                      ? ColorSchema.primaryColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Divider(
                      color: ColorSchema.dividerColor,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SaveButton(
              title: (isFromRegister) ? "Next" : "Save",
              onTap: () {
                if (isFromRegister) {
                  Get.toNamed(Routes.partnerPreferencesScreen);
                } else {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Routes.bottomBarScreen));
                }
              },
              buttonType: ButtonType.enable,
            ),
          ),
        ],
      ),
    );
  }
}
