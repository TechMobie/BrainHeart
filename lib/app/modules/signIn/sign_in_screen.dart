import 'package:brain_heart/app/modules/signIn/sing_in_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/common_textfield.dart';
import 'package:brain_heart/helper/utils/common_functions.dart';
import 'package:brain_heart/helper/utils/constants.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/helper/utils/math_utils.dart';
import 'package:brain_heart/helper/utils/pref_utils.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final SignInController _signInController =
      Get.put<SignInController>(SignInController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchema.whiteColor,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: (MathUtilities.safeAreaTopHeight(context) +
                          getHeightOfPerspactiveDevice()) +
                      10),
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(ImageConstants.signInIcon),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: (MathUtilities.safeAreaTopHeight(context) +
                      getHeightOfPerspactiveDevice()),
                  left: 20,
                  right: 20,
                  bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    ImageConstants.backIcon,
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(flex: 3),
                            Text(
                              "Sign In",
                              style: const TextStyle()
                                  .semiBold48
                                  .textColor(ColorSchema.dark1),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra cras iaculis et .",
                              style: const TextStyle().normal14.textColor(
                                  ColorSchema.dark1.withOpacity(0.7)),
                            ),
                            const Spacer(),
                            _phoneNumberField(),
                            const Spacer(flex: 4),
                            _socialSignin(),
                            const Spacer(
                              flex: 2,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                isFromRegister = true;
                                Get.toNamed(Routes.accountSetUpScreen)!
                                    .then((value) {
                                  isFromRegister = false;
                                });
                              },
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: " Register",
                                          style: const TextStyle()
                                              .semiBold14
                                              .textColor(
                                                ColorSchema.primaryColor
                                                    .withOpacity(0.7),
                                              ))
                                    ],
                                    text: "Don’t have an account?",
                                    style: const TextStyle().normal14.textColor(
                                          ColorSchema.dark1.withOpacity(0.7),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            _button()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _socialSignin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: ColorSchema.blue),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageConstants.faceBookIcon),
              const Spacer(),
              Text(
                "Sign In with Facebook",
                style: const TextStyle()
                    .normal14
                    .textColor(ColorSchema.whiteColor),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: ColorSchema.dark1.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(50),
              color: ColorSchema.whiteColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageConstants.googleIcon),
              const Spacer(),
              Text(
                "Sign In with Google",
                style: const TextStyle()
                    .normal14
                    .textColor(ColorSchema.blackColor),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Button _button() {
    return Button(
      title: "Sign In",
      buttonType: ButtonType.enable,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          PrefUtils.getInstance
              .writeData(PrefUtils.getInstance.accessToken, "userLoggedIn");
          Get.offAllNamed(Routes.bottomBarScreen);
        }
      },
    );
  }

  CommonTextField _phoneNumberField() {
    return CommonTextField(
      onChanged: (val) {},
      labelText: "Phone number",
      inputController: _signInController.phoneTextEditingController,
      focusNode: _signInController.focusNode,
      inputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      validation: (val) {
        if ((val ?? "").isEmpty) {
          return "Enter mobile number";
        }
      },
    );
  }
}
