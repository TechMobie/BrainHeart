import 'package:brain_heart/app/modules/chat/chat_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:get/get.dart';

class AllChatScreen extends StatelessWidget {
  AllChatScreen({Key? key}) : super(key: key);
  final ChatController _chatController =
      Get.put<ChatController>(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CommonHeader(
            title: "All your Chats",
            isShowBackIcon: false,
          ),
          // _noChatWidget(),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 100),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        _chatController.messages.clear();
                        _chatController.chatTextController.clear();
                        _chatController.testIndex = index;
                        Get.toNamed(Routes.chatScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorSchema.primaryColor,
                              ),
                              child: Center(
                                child: FluttermojiCircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.transparent,
                                ),
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
    if (index == 1 || index == 2 || index == 3) {
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
    } else if (index == 4) {
      return Center(
          child: Row(
        children: [
          SvgPicture.asset(ImageConstants.clockIcon),
          const SizedBox(
            width: 5,
          ),
          Text(
            "2h left",
            style:
                const TextStyle().normal12.textColor(ColorSchema.primaryColor),
          ),
        ],
      ));
    } else if (index == 5) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorSchema.yellowColor),
        child: Center(
            child: Text(
          "Provide feedback",
          style: const TextStyle().normal10.textColor(ColorSchema.whiteColor),
        )),
      );
    } else if (index == 6) {
      return Center(
          child: Text(
        "Awaiting feedback",
        style: const TextStyle().normal10.textColor(ColorSchema.yellowColor),
      ));
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

  Expanded _noChatWidget() {
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
          Text(
            "We are sorry",
            style: const TextStyle().semiBold32.textColor(ColorSchema.dark1),
          ),
          const SizedBox(height: 20),
          Text(
            "We could not find anyone matching\nyour criteria yet. We keep looking\nand we will notify you as soon we\nfind them",
            textAlign: TextAlign.center,
            style: const TextStyle().normal16.textColor(ColorSchema.dark1),
          ),
          const Spacer(),
          Text(
            "Adjust your Criteria",
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
