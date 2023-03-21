import 'package:brain_heart/helper/utils/common_functions.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/helper/utils/math_utils.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? ontap;
  final VoidCallback? cancelOnTap;
  final bool isShowBackIcon;
  final bool isShowCancel;
  final bool isShowGps;
  final Color? backGroundColor;

  const CommonHeader(
      {Key? key,
      this.title = "",
      this.subTitle = "",
      this.isShowCancel = false,
      this.isShowBackIcon = true,
      this.isShowGps = false,
      this.ontap,
      this.cancelOnTap,
      this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: ((MathUtilities.safeAreaTopHeight(context) +
                  getHeightOfPerspactiveDevice())) +
              ((isNullEmptyOrFalse(subTitle)) ? 10 : 0),
          bottom: (isNullEmptyOrFalse(subTitle)) ? 24 : 20,
          left: 20,
          right: 20),
      color: backGroundColor ?? ColorSchema.primaryColor,
      child: Stack(
        alignment: (isNullEmptyOrFalse(subTitle))
            ? Alignment.bottomCenter
            : Alignment.center,
        children: [
          if (isShowBackIcon)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (ontap != null) {
                      ontap!();
                    } else {
                      Get.back();
                    }
                  },
                  child: SvgPicture.asset(
                    ImageConstants.backIcon,
                    color: ColorSchema.whiteColor,
                  ),
                ),
                const Spacer(),
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(
                    title,
                    style: const TextStyle()
                        .semiBold16
                        .textColor(ColorSchema.whiteColor),
                  ),
                  const Spacer(),
                ],
              ),
              if (!isNullEmptyOrFalse(subTitle))
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Text(
                      subTitle,
                      style: const TextStyle()
                          .normal12
                          .textColor(ColorSchema.whiteColor),
                    ),
                    const Spacer(),
                  ],
                ),
            ],
          ),
          if (isShowCancel)
            GestureDetector(
              onTap: () {
                if (cancelOnTap != null) {
                  cancelOnTap!();
                } else {
                  Get.back();
                }
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Cancel",
                  style: const TextStyle()
                      .normal16
                      .textColor(ColorSchema.whiteColor),
                ),
              ),
            ),
          if (isShowGps)
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(ImageConstants.gpsIcon),
              ),
            ),
        ],
      ),
    );
  }
}
