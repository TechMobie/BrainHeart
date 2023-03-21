import 'package:brain_heart/app/modules/yourMatches/matches_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:get/get.dart';

class AllMatchesScreen extends StatelessWidget {
  AllMatchesScreen({Key? key}) : super(key: key);
  final MatchesController _matchesController =
      Get.put<MatchesController>(MatchesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CommonHeader(
            title: "Your Matches",
            isShowBackIcon: false,
          ),
          // _noMatchWidget(),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 100),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        _matchesController.messages.clear();
                        _matchesController.chatTextController.clear();
                        Get.toNamed(Routes.matchesChatScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorSchema.whiteColor,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: (index == 2 || index == 3)
                                          ? Border.all(
                                              color: (index == 2)
                                                  ? ColorSchema.yellowColor
                                                  : ColorSchema.positiveColor,
                                              width: 2)
                                          : Border.all(
                                              color: Colors.transparent,
                                              width: 2),
                                    ),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorSchema.primaryColor,
                                        border: (index == 2 || index == 3)
                                            ? Border.all(
                                                color: ColorSchema.whiteColor,
                                                width: 2)
                                            : Border.all(
                                                color: Colors.transparent,
                                                width: 2),
                                      ),
                                      child: Center(
                                        child: FluttermojiCircleAvatar(
                                          radius: 60,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: ColorSchema.expression,
                                          border: Border.all(
                                              color: ColorSchema.whiteColor,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Center(
                                          child: SvgPicture.asset(
                                              ImageConstants.heart)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Robin Barnes",
                                    style: const TextStyle()
                                        .semiBold18
                                        .textColor(ColorSchema.dark1),
                                  ),
                                  Text(
                                    "Viverra nulla.",
                                    style: const TextStyle().normal14.textColor(
                                        ColorSchema.dark1.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _messageStatusStates(index),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "10:20am",
                                  style: const TextStyle().normal14.textColor(
                                      ColorSchema.dark1.withOpacity(0.4)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Divider(
                      height: 0,
                      color: ColorSchema.dark1.withOpacity(0.1),
                    ),
                itemCount: 10),
          ),
        ],
      ),
    );
  }

  Widget _messageStatusStates(int index) {
    if (index == 1 || index == 2) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorSchema.primaryColor),
        child: Center(
            child: Text(
          "Your Turn",
          style: const TextStyle().semiBold13.textColor(ColorSchema.whiteColor),
        )),
      );
    }
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorSchema.primaryColor),
      child: Center(
          child: Text(
        "2",
        style: const TextStyle().semiBold13.textColor(ColorSchema.whiteColor),
      )),
    );
  }

  Expanded _noMatchWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            ImageConstants.noChatIcon,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Text(
              "You don’t have match yet!",
              textAlign: TextAlign.center,
              style: const TextStyle().semiBold32.textColor(ColorSchema.dark1),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Text(
              "You don’t have match yet, keep chatting with peope!",
              textAlign: TextAlign.center,
              style: const TextStyle().normal16.textColor(ColorSchema.dark1),
            ),
          ),
          const Spacer(),
          Text(
            "Chat more",
            textAlign: TextAlign.center,
            style:
                const TextStyle().medium16.textColor(ColorSchema.primaryColor),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
