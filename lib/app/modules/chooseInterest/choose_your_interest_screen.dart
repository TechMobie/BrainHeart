import 'package:brain_heart/app/modules/chooseInterest/choose_your_interest_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/button/save_button.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/helper/utils/constants.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChooseYourInterestScreen extends StatelessWidget {
  ChooseYourInterestScreen({Key? key}) : super(key: key);
  final ChooseYourInterestController _chooseYourInterestController =
      Get.put<ChooseYourInterestController>(ChooseYourInterestController());
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
                  title: "Choose your Interests",
                  subTitle: "Select 3 max/category",
                  isShowBackIcon: true,
                  isShowCancel: (isFromRegister) ? false : true,
                  cancelOnTap: () {
                    Get.back();
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
                          _sportsWidget(),
                          const SizedBox(
                            height: 40,
                          ),
                          _booksWidget(),
                          const SizedBox(
                            height: 40,
                          ),
                          _musicWidget(),
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
              title: (isFromRegister) ? "Next" : "Save",
              onTap: () {
                if (isFromRegister) {
                  Get.toNamed(Routes.educationScreen);
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

  Column _booksWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Books",
          style: const TextStyle().normal14.textColor(ColorSchema.dark1),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          verticalDirection: VerticalDirection.down,
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 5,
          runSpacing: 5,
          children: List.generate(
              _chooseYourInterestController.booksList.length, (index) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    _chooseYourInterestController
                            .booksList[index].isSelected.value =
                        !_chooseYourInterestController
                            .booksList[index].isSelected.value;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        height: 40,
                        duration: const Duration(milliseconds: 400),
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: (_chooseYourInterestController
                                  .booksList[index].isSelected.value)
                              ? ColorSchema.primaryColor.withOpacity(0.1)
                              : ColorSchema.whiteColor,
                          border: Border.all(
                            color: (_chooseYourInterestController
                                    .booksList[index].isSelected.value)
                                ? Colors.transparent
                                : ColorSchema.dark1.withOpacity(0.1),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                _chooseYourInterestController
                                        .booksList[index].title ??
                                    "",
                                style: (_chooseYourInterestController
                                        .booksList[index].isSelected.value)
                                    ? const TextStyle()
                                        .medium14
                                        .textColor(ColorSchema.dark1)
                                    : const TextStyle().medium14.textColor(
                                        ColorSchema.dark1.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
        ),
      ],
    );
  }

  Column _musicWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Music",
          style: const TextStyle().normal14.textColor(ColorSchema.dark1),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          verticalDirection: VerticalDirection.down,
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 5,
          runSpacing: 5,
          children: List.generate(
              _chooseYourInterestController.musicList.length, (index) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    _chooseYourInterestController
                            .musicList[index].isSelected.value =
                        !_chooseYourInterestController
                            .musicList[index].isSelected.value;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        height: 40,
                        duration: const Duration(milliseconds: 400),
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: (_chooseYourInterestController
                                  .musicList[index].isSelected.value)
                              ? ColorSchema.primaryColor.withOpacity(0.1)
                              : ColorSchema.whiteColor,
                          border: Border.all(
                            color: (_chooseYourInterestController
                                    .musicList[index].isSelected.value)
                                ? Colors.transparent
                                : ColorSchema.dark1.withOpacity(0.1),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                _chooseYourInterestController
                                        .musicList[index].title ??
                                    "",
                                style: (_chooseYourInterestController
                                        .musicList[index].isSelected.value)
                                    ? const TextStyle()
                                        .medium14
                                        .textColor(ColorSchema.dark1)
                                    : const TextStyle().medium14.textColor(
                                        ColorSchema.dark1.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
        ),
      ],
    );
  }

  Column _sportsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sports",
          style: const TextStyle().normal14.textColor(ColorSchema.dark1),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          verticalDirection: VerticalDirection.down,
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 5,
          runSpacing: 5,
          children: List.generate(
              _chooseYourInterestController.sportsList.length, (index) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    _chooseYourInterestController
                            .sportsList[index].isSelected.value =
                        !_chooseYourInterestController
                            .sportsList[index].isSelected.value;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        height: 40,
                        duration: const Duration(milliseconds: 400),
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: (_chooseYourInterestController
                                  .sportsList[index].isSelected.value)
                              ? ColorSchema.primaryColor.withOpacity(0.1)
                              : ColorSchema.whiteColor,
                          border: Border.all(
                            color: (_chooseYourInterestController
                                    .sportsList[index].isSelected.value)
                                ? Colors.transparent
                                : ColorSchema.dark1.withOpacity(0.1),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                _chooseYourInterestController
                                        .sportsList[index].title ??
                                    "",
                                style: (_chooseYourInterestController
                                        .sportsList[index].isSelected.value)
                                    ? const TextStyle()
                                        .medium14
                                        .textColor(ColorSchema.dark1)
                                    : const TextStyle().medium14.textColor(
                                        ColorSchema.dark1.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
        ),
        if (!isFromRegister)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                "You reched max in this category",
                style: const TextStyle()
                    .normal12
                    .textColor(ColorSchema.dark1.withOpacity(0.5)),
              ),
            ],
          ),
      ],
    );
  }
}
