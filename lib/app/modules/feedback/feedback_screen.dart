import 'package:brain_heart/app/modules/feedback/feedbacl_controller.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/components/common_textfield.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackScreen extends StatelessWidget {
  FeedBackScreen({Key? key}) : super(key: key);
  final FeedBackController _feedBackController = FeedBackController();

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
                  const CommonHeader(
                    title: "Feedback",
                    isShowBackIcon: true,
                    isShowCancel: true,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            "How is your experience with us so far?",
                            style: const TextStyle()
                                .semiBold20
                                .textColor(ColorSchema.dark1),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _feedBackField(),
                          const Spacer(),
                          _button()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CommonTextField _feedBackField() {
    return CommonTextField(
      onChanged: (val) {
        _feedBackController.feedbackString.value = val;
      },
      labelText: "Enter your Feedback",
      inputController: _feedBackController.feedbackController,
      focusNode: _feedBackController.feedbackNode,
      inputAction: TextInputAction.done,
    );
  }

  Obx _button() {
    return Obx(
      () => Center(
        child: SizedBox(
          width: 150,
          child: Button(
            title: "Submit",
            onTap: () {
              Get.showSnackbar(
                GetSnackBar(
                  backgroundColor: ColorSchema.primaryColor.withOpacity(0.1),
                  margin: const EdgeInsets.only(bottom: 80),
                  message: "fdf",
                  isDismissible: true,
                  duration: const Duration(seconds: 2),
                  messageText: Text("Thank you for your feedback!",
                      style: const TextStyle()
                          .semiBold16
                          .textColor(ColorSchema.primaryColor)),
                ),
              );
            },
            buttonType: (_feedBackController.feedbackString.value.isNotEmpty)
                ? ButtonType.enable
                : ButtonType.disable,
          ),
        ),
      ),
    );
  }
}
