import 'package:brain_heart/app/modules/deleteAccount/delete_account_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/components/common_textfield.dart';
import 'package:brain_heart/helper/utils/pref_utils.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountScreen extends StatelessWidget {
  DeleteAccountScreen({Key? key}) : super(key: key);
  final DeleteAccountController _deleteAccountController =
      Get.put<DeleteAccountController>(DeleteAccountController());
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
                    title: "Delete Account",
                    isShowBackIcon: true,
                    isShowCancel: false,
                    backGroundColor: ColorSchema.expression,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "John Doe we are very\nsad to see you go",
                              style: const TextStyle()
                                  .semiBold20
                                  .textColor(ColorSchema.dark1),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Please can you  give us a reason why you are leaving?",
                              style: const TextStyle()
                                  .normal18
                                  .textColor(ColorSchema.dark1),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            _reasonWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 20),
                    child: Column(
                      children: [
                        _anyOtherField(),
                        const SizedBox(height: 30),
                        _button()
                      ],
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

  ListView _reasonWidget() {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      _deleteAccountController.reasonList.every((element) {
                        element.isSelected.value = false;
                        return true;
                      });
                      _deleteAccountController
                          .reasonList[index].isSelected.value = true;
                    },
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: ColorSchema.dark1)),
                      child: (_deleteAccountController
                              .reasonList[index].isSelected.value)
                          ? const Icon(Icons.done)
                          : const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  _deleteAccountController.reasonList[index].title ?? "",
                  style:
                      const TextStyle().normal13.textColor(ColorSchema.dark1),
                )
              ],
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: _deleteAccountController.reasonList.length);
  }

  CommonTextField _anyOtherField() {
    return CommonTextField(
      onChanged: (val) {},
      focusNode: _deleteAccountController.otherNode,
      labelText: "Any other feedback?",
      inputController: _deleteAccountController.otherReason,
    );
  }

  Row _button() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              PrefUtils.getInstance.clearLocalStorage();
              Get.offAllNamed(Routes.signInScreen);
            },
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: ColorSchema.expression)),
              child: Center(
                  child: Text(
                'Delete Account',
                style: const TextStyle()
                    .medium16
                    .textColor(ColorSchema.expression),
              )),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
            child: Button(
          title: "Cancel",
          buttonType: ButtonType.enable,
        )),
      ],
    );
  }
}
