import 'package:brain_heart/app/modules/chat/chat_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/button/button.dart';
import 'package:brain_heart/components/custom_clipper.dart';
import 'package:brain_heart/helper/utils/common_functions.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/helper/utils/math_utils.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final ChatController _chatController = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            _header(context),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      ImageConstants.chatBackground,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _messages(),
                        _textField(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _messages() {
    return Expanded(
        child: Obx(
      () => (_chatController.messages.isEmpty)
          ? Center(
              child: Text(
                "No messages yet",
                style: const TextStyle()
                    .semiBold16
                    .textColor(ColorSchema.dark1.withOpacity(0.5)),
              ),
            )
          : SingleChildScrollView(
              controller: _chatController.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorSchema.whiteColor),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorSchema.primaryColor,
                              ),
                              child: Center(
                                  child: SvgPicture.asset(
                                      ImageConstants.brainHeart)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: RichText(
                                  text: TextSpan(
                                      text: "Message from BrainHeart",
                                      style: const TextStyle()
                                          .semiBold14
                                          .textColor(ColorSchema.dark1),
                                      children: [
                                    TextSpan(
                                        text: " all users",
                                        style: const TextStyle()
                                            .normal14
                                            .textColor(ColorSchema.dark1),
                                        children: const [])
                                  ])),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi scelerisque sed iaculis lectus vel lectus vitae.",
                          style: const TextStyle()
                              .normal12
                              .textColor(ColorSchema.dark1.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "10:20am",
                            style: const TextStyle()
                                .normal12
                                .textColor(ColorSchema.dark1.withOpacity(0.7)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorSchema.primaryColor.withOpacity(0.07)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorSchema.dark1,
                              ),
                              child: Center(
                                  child: SvgPicture.asset(
                                      ImageConstants.brainHeart)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: RichText(
                                  text: TextSpan(
                                      text: "Message from BrainHeart",
                                      style: const TextStyle()
                                          .semiBold14
                                          .textColor(ColorSchema.dark1),
                                      children: [
                                    TextSpan(
                                        text: " to you",
                                        style: const TextStyle()
                                            .normal14
                                            .textColor(ColorSchema.dark1),
                                        children: const [])
                                  ])),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi scelerisque sed iaculis lectus vel lectus vitae.",
                          style: const TextStyle()
                              .normal12
                              .textColor(ColorSchema.dark1.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "10:20am",
                            style: const TextStyle()
                                .normal12
                                .textColor(ColorSchema.dark1.withOpacity(0.7)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => ListView.separated(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => (index.isOdd)
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: const BoxDecoration(
                                      color: ColorSchema.primaryColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      _chatController.messages[index],
                                      style: const TextStyle()
                                          .normal12
                                          .textColor(ColorSchema.whiteColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "10:20am",
                                    style: const TextStyle().normal10.textColor(
                                          ColorSchema.dark1.withOpacity(0.7),
                                        ),
                                  )
                                ],
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: const BoxDecoration(
                                      color: ColorSchema.whiteColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Text(
                                      _chatController.messages[index],
                                      style: const TextStyle()
                                          .normal12
                                          .textColor(ColorSchema.dark1
                                              .withOpacity(0.7)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "10:20am",
                                    style: const TextStyle().normal10.textColor(
                                          ColorSchema.dark1.withOpacity(0.7),
                                        ),
                                  )
                                ],
                              ),
                            ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: _chatController.messages.length))
                ],
              ),
            ),
    ));
  }

  Align _textField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: (_chatController.testIndex == 1)
          ? _keepChatting()
          : (_chatController.testIndex == 2)
              ? _longAreMessages()
              : (_chatController.testIndex == 3)
                  ? _reactionTIme()
                  : (_chatController.testIndex == 4)
                      ? _waitingForFeedback()
                      : (_chatController.testIndex == 5)
                          ? _chatEnded()
                          : Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              height: 100,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: TextField(
                                        cursorColor: ColorSchema.primaryColor,
                                        controller:
                                            _chatController.chatTextController,
                                        onTap: () {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback(
                                                  (timeStamp) async {
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));

                                            if (_chatController
                                                .scrollController.hasClients) {
                                              _chatController.scrollController
                                                  .jumpTo(_chatController
                                                      .scrollController
                                                      .position
                                                      .maxScrollExtent);
                                            }
                                          });
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type message...",
                                            hintStyle: const TextStyle()
                                                .normal14
                                                .textColor(ColorSchema.dark1
                                                    .withOpacity(0.5)),
                                            filled: true,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    bottom: 10, left: 30),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: SvgPicture.asset(
                                                ImageConstants.emoji,
                                              ),
                                            ),
                                            prefixIconConstraints:
                                                const BoxConstraints(
                                                    maxHeight: 40,
                                                    maxWidth: 60),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            fillColor: ColorSchema.dark1
                                                .withOpacity(0.1)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Material(
                                    color: ColorSchema.primaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () async {
                                        if (!isNullEmptyOrFalse(_chatController
                                            .chatTextController.text)) {
                                          _chatController.messages.add(
                                              _chatController
                                                  .chatTextController.text);
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));

                                          if (_chatController
                                              .scrollController.hasClients) {
                                            _chatController.scrollController
                                                .jumpTo(_chatController
                                                    .scrollController
                                                    .position
                                                    .maxScrollExtent);
                                          }
                                          _chatController.chatTextController
                                              .clear();
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                              ImageConstants.sendIcon),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
    );
  }

  ClipPath _reactionTIme() {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
        height: MediaQuery.of(Get.context!).size.height / 2.5,
        width: double.infinity,
        color: ColorSchema.whiteColor,
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "How do you perceive Robin reaction time?",
                textAlign: TextAlign.center,
                style:
                    const TextStyle().semiBold20.textColor(ColorSchema.dark1),
              ),
              ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Material(
                        color: ColorSchema.dark1,
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                _chatController.options[index],
                                style: const TextStyle()
                                    .medium16
                                    .textColor(ColorSchema.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: _chatController.options.length),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipPath _longAreMessages() {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(Get.context!).size.height / 2.5,
        color: ColorSchema.whiteColor,
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "How long are messages from Robin?",
                textAlign: TextAlign.center,
                style:
                    const TextStyle().semiBold20.textColor(ColorSchema.dark1),
              ),
              ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Material(
                        color: ColorSchema.dark1,
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                _chatController.options[index],
                                style: const TextStyle()
                                    .medium16
                                    .textColor(ColorSchema.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: _chatController.options.length),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipPath _chatEnded() {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
        width: double.infinity,
        color: ColorSchema.expression.withOpacity(0.1),
        padding:
            const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 40),
        child: Column(
          children: [
            Text(
              "Chat Ended",
              textAlign: TextAlign.center,
              style: const TextStyle()
                  .semiBold16
                  .textColor(ColorSchema.expression),
            ),
          ],
        ),
      ),
    );
  }

  ClipPath _waitingForFeedback() {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
        width: double.infinity,
        color: ColorSchema.yellowColor.withOpacity(0.1),
        padding:
            const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 40),
        child: Column(
          children: [
            Text(
              "Waiting for feedback from Robin...",
              textAlign: TextAlign.center,
              style: const TextStyle()
                  .semiBold16
                  .textColor(ColorSchema.yellowColor),
            ),
          ],
        ),
      ),
    );
  }

  ClipPath _keepChatting() {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
        width: double.infinity,
        color: ColorSchema.whiteColor,
        padding:
            const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 40),
        child: Column(
          children: [
            Text(
              "Do you want to keep chatting with Robin?",
              textAlign: TextAlign.center,
              style: const TextStyle().semiBold20.textColor(ColorSchema.dark1),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Expanded(
                  child: Button(
                    title: "Skip",
                    buttonType: ButtonType.enable,
                    backgroundColor: ColorSchema.expression,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Button(
                    title: "Keep",
                    buttonType: ButtonType.enable,
                    backgroundColor: ColorSchema.positiveColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: ((MathUtilities.safeAreaTopHeight(context) +
                  getHeightOfPerspactiveDevice())) +
              10,
          bottom: 20,
          left: 20,
          right: 12),
      color: ColorSchema.primaryColor,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              ImageConstants.backIcon,
              color: ColorSchema.whiteColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.otherUserProfileScreen);
            },
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorSchema.whiteColor, width: 2),
                    color: ColorSchema.primaryColor.withOpacity(0.5),
                  ),
                  child: Center(
                    child: FluttermojiCircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Robin Barnes",
                      style: const TextStyle()
                          .semiBold18
                          .textColor(ColorSchema.whiteColor),
                    ),
                    Text(
                      "3 days of chatting",
                      style: const TextStyle()
                          .normal14
                          .textColor(ColorSchema.whiteColor.withOpacity(0.7)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          PopupMenuButton<int>(
            icon: SvgPicture.asset(ImageConstants.dropDownIcon),
            onSelected: (val) {
              Get.toNamed(Routes.reportUserScreen);
            },
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                value: 1,
                // row has two child icon and text.
                child: Row(
                  children: [
                    SvgPicture.asset(ImageConstants.warning),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Report User")
                  ],
                ),
              ),
              // popupmenu item 2
            ],
            padding: const EdgeInsets.all(0),
            offset: const Offset(0, 50),
            color: Colors.white,
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            elevation: 2,
          ),
        ],
      ),
    );
  }
}
