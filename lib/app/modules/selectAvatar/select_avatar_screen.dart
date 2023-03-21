import 'package:brain_heart/app/modules/selectAvatar/select_avatar_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/button/save_button.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/helper/utils/constants.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:get/get.dart';

class SelectAvatarScreen extends StatelessWidget {
  SelectAvatarScreen({Key? key}) : super(key: key);
  final SelectAvatarController _selectAvatarController =
      Get.put<SelectAvatarController>(SelectAvatarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                CommonHeader(
                  title: "Select Your Avatar",
                  isShowBackIcon: true,
                  isShowCancel: (isFromRegister) ? false : true,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 50,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 90),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 25,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 60,
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            _selectAvatarController.currentIndex.value = index;
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorSchema.primaryColor,
                              // borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: (_selectAvatarController
                                            .currentIndex.value ==
                                        index)
                                    ? ColorSchema.dark1
                                    : ColorSchema.dark1.withOpacity(0.1),
                              ),
                            ),
                            child: Center(
                              child: FluttermojiCircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 60,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Obx(
            () => Align(
              alignment: Alignment.bottomCenter,
              child: SaveButton(
                title: (isFromRegister) ? "Next" : "Save",
                onTap: () {
                  if (isFromRegister) {
                    Get.toNamed(Routes.locationScreen);
                  } else {
                    Get.back();
                  }
                },
                buttonType: (_selectAvatarController.currentIndex.value != (-1))
                    ? ButtonType.enable
                    : ButtonType.disable,
              ),
            ),
          )
        ],
      ),
    );
  }
}
