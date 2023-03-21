import 'package:brain_heart/app/modules/accountSetUp/account_set_up_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/button/save_button.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/components/common_textfield.dart';
import 'package:brain_heart/helper/utils/constants.dart';
import 'package:brain_heart/helper/utils/enum_utils.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountSetUpScreen extends StatelessWidget {
  AccountSetUpScreen({Key? key}) : super(key: key);
  final AccountSetUpController _accountSetUpController =
      AccountSetUpController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonHeader(
                    title: "Account Setup",
                    isShowBackIcon: true,
                    isShowCancel: (isFromRegister) ? false : true,
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
                              height: 30,
                            ),
                            _name(),
                            const SizedBox(
                              height: 20,
                            ),
                            _jobProfession(),
                            const SizedBox(
                              height: 20,
                            ),
                            _dateOfBirth(context),
                            _gender(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 6,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            _button(),
          ],
        ),
      ),
    );
  }

  CommonTextField _name() {
    return CommonTextField(
      onChanged: (val) {},
      labelText: "Display Name",
      postfixWid: SvgPicture.asset(
        ImageConstants.profileIcon1,
        color: ColorSchema.blackColor,
        height: 25,
        width: 25,
      ),
      inputAction: TextInputAction.next,
      inputController: _accountSetUpController.nameController,
      focusNode: _accountSetUpController.nameFocusNode,
    );
  }

  CommonTextField _jobProfession() {
    return CommonTextField(
      onChanged: (val) {},
      // hintText: "Display Name",
      labelText: "Job/Profession",
      postfixWid: SvgPicture.asset(
        ImageConstants.jobIcon,
        color: ColorSchema.blackColor,
        height: 25,
        width: 25,
      ),

      inputController: _accountSetUpController.professionController,
      focusNode: _accountSetUpController.professionFocusNode,
    );
  }

  GestureDetector _dateOfBirth(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1960),
          lastDate: DateTime.now(),
        ).then((value) {
          if (value != null) {
            _accountSetUpController.dateOfBirthController.text =
                "${value.day}/${value.month}/${value.year}";
          }
        });
      },
      child: IgnorePointer(
        ignoring: true,
        child: CommonTextField(
          onChanged: (val) {},
          // hintText: "Display Name",
          labelText: "Date of birth",
          postfixWid: SvgPicture.asset(
            ImageConstants.calendar,
            color: ColorSchema.blackColor,
            height: 25,
            width: 25,
          ),

          ontap: () {},
          suffixIcon: SvgPicture.asset(
            ImageConstants.dropDown,
            color: ColorSchema.blackColor,
            height: 25,
            width: 25,
          ),
          inputController: _accountSetUpController.dateOfBirthController,
          focusNode: _accountSetUpController.dateOfBirthFocusNode,
        ),
      ),
    );
  }

  Column _gender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Gender",
          style: const TextStyle()
              .normal12
              .textColor(ColorSchema.dark1.withOpacity(0.5)),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _accountSetUpController.gender.value = Gender.male;
          },
          child: Row(
            children: [
              Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: (_accountSetUpController.gender.value ==
                                  Gender.male)
                              ? ColorSchema.primaryColor
                              : ColorSchema.dark1)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                          (_accountSetUpController.gender.value == Gender.male)
                              ? ColorSchema.primaryColor
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
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
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _accountSetUpController.gender.value = Gender.female;
          },
          child: Row(
            children: [
              Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: (_accountSetUpController.gender.value ==
                                  Gender.female)
                              ? ColorSchema.primaryColor
                              : ColorSchema.dark1)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: (_accountSetUpController.gender.value ==
                              Gender.female)
                          ? ColorSchema.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
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
        ),
      ],
    );
  }

  Align _button() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: (isFromRegister)
          ? SaveButton(
              title: "Next",
              buttonType: ButtonType.enable,
              onTap: () {
                Get.toNamed(Routes.selectAvatarScreen);
              },
            )
          : SaveButton(
              buttonType: ButtonType.enable,
              onTap: () {
                Get.back();
              },
            ),
    );
  }
}
