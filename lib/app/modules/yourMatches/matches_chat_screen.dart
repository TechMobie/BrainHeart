import 'package:brain_heart/app/modules/yourMatches/matches_controller.dart';
import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/helper/utils/common_functions.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/helper/utils/math_utils.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:get/get.dart';

class MatchesChatScreen extends StatefulWidget {
  const MatchesChatScreen({Key? key}) : super(key: key);

  @override
  State<MatchesChatScreen> createState() => _MatchesChatScreenState();
}

class _MatchesChatScreenState extends State<MatchesChatScreen> {
  final MatchesController _matchesController = Get.find<MatchesController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _youHaveMatch();
      _waitingToRevelPhotos();
    });
  }

  SnackbarController _waitingToRevelPhotos() {
    return Get.showSnackbar(
      GetSnackBar(
        backgroundColor: ColorSchema.yellowColor.withOpacity(0.1),
        margin: const EdgeInsets.only(bottom: 100),
        message: "fdf",
        isDismissible: false,
        padding: const EdgeInsets.all(20),
        // duration: const Duration(seconds: 2),
        messageText: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                ImageConstants.closeIcon,
                color: ColorSchema.yellowColor,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text("Waiting on Robin to Revel photos...",
                  style: const TextStyle()
                      .semiBold16
                      .textColor(ColorSchema.yellowColor)),
            ),
          ],
        ),
      ),
    );
  }

  SnackbarController _youHaveMatch() {
    return Get.showSnackbar(
      GetSnackBar(
        backgroundColor: ColorSchema.positiveColor.withOpacity(0.1),
        margin: const EdgeInsets.only(bottom: 100),
        message: "fdf",
        isDismissible: false,
        padding: const EdgeInsets.all(10),
        // duration: const Duration(seconds: 2),
        messageText: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                ImageConstants.closeIcon,
                color: ColorSchema.positiveColor,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text("You have a match!",
                  style: const TextStyle()
                      .semiBold16
                      .textColor(ColorSchema.positiveColor)),
            ),
            // const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorSchema.positiveColor),
              child: Text(
                "Revel photos",
                style: const TextStyle()
                    .medium16
                    .textColor(ColorSchema.whiteColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _youHaveMatch();
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
      () => (_matchesController.messages.isEmpty)
          ? Center(
              child: Text(
                "No messages yet",
                style: const TextStyle()
                    .semiBold16
                    .textColor(ColorSchema.dark1.withOpacity(0.5)),
              ),
            )
          : SingleChildScrollView(
              controller: _matchesController.scrollController,
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
                        color: ColorSchema.primaryColor.withOpacity(0.05)),
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
                                      _matchesController.messages[index],
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
                                      _matchesController.messages[index],
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
                      itemCount: _matchesController.messages.length))
                ],
              ),
            ),
    ));
  }

  Align _textField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                  controller: _matchesController.chatTextController,
                  onTap: () {
                    WidgetsBinding.instance
                        .addPostFrameCallback((timeStamp) async {
                      await Future.delayed(const Duration(milliseconds: 100));
                      if (_matchesController.scrollController.hasClients) {
                        _matchesController.scrollController.jumpTo(
                            _matchesController
                                .scrollController.position.maxScrollExtent);
                      }
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Type message...",
                      hintStyle: const TextStyle()
                          .normal14
                          .textColor(ColorSchema.dark1.withOpacity(0.5)),
                      filled: true,
                      contentPadding:
                          const EdgeInsets.only(bottom: 10, left: 30),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SvgPicture.asset(
                          ImageConstants.emoji,
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(maxHeight: 40, maxWidth: 60),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                      fillColor: ColorSchema.dark1.withOpacity(0.1)),
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
                  if (!isNullEmptyOrFalse(
                      _matchesController.chatTextController.text)) {
                    _matchesController.messages
                        .add(_matchesController.chatTextController.text);
                    await Future.delayed(const Duration(milliseconds: 100));

                    if (_matchesController.scrollController.hasClients) {
                      _matchesController.scrollController.jumpTo(
                          _matchesController
                              .scrollController.position.maxScrollExtent);
                    }

                    _matchesController.chatTextController.clear();
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
                    child: SvgPicture.asset(ImageConstants.sendIcon),
                  ),
                ),
              ),
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
                  height: 52,
                  width: 52,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: ColorSchema.whiteColor, width: 2),
                          color: ColorSchema.primaryColor.withOpacity(0.5),
                        ),
                        child: FluttermojiCircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: ColorSchema.expression,
                              border: Border.all(
                                  color: ColorSchema.whiteColor, width: 1),
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                              child: SvgPicture.asset(ImageConstants.heart)),
                        ),
                      )
                    ],
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
            // constraints: BoxConstraints(maxHeight: 100),
            onSelected: (val) {
              if (val == 0) {
                Get.toNamed(Routes.reportUserScreen);
              } else {
                Get.back();
              }
            },
            constraints: const BoxConstraints(maxHeight: 109, maxWidth: 250),
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                padding: const EdgeInsets.only(left: 10, right: 5),
                value: 1,
                // row has two child icon and text.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(ImageConstants.warning),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Report User",
                          style: const TextStyle()
                              .normal16
                              .textColor(ColorSchema.dark1),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Divider(
                      height: 0,
                      indent: 10,
                      endIndent: 10,
                      color: ColorSchema.dark1.withOpacity(0.1),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                padding: const EdgeInsets.only(left: 10, right: 5),
                value: 2,

                // row has two child icon and text.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageConstants.deleteIcon),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Remove match",
                      style: const TextStyle()
                          .normal16
                          .textColor(ColorSchema.dark1),
                    )
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
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
          ),
        ],
      ),
    );
  }
}
