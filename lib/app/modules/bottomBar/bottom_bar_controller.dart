import 'package:brain_heart/components/bottom_nav_bar.dart';
import 'package:brain_heart/helper/utils/constants.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  CircularBottomNavigationController navigationController =
      CircularBottomNavigationController(0);
  RxInt currentPage = 0.obs;
  List<TabItem> tabItems = List.of([
    TabItem(
      ImageConstants.matchedIcon,
      "Matched",
      Colors.red,
      labelStyle:
          const TextStyle().semiBold12.textColor(ColorSchema.whiteColor),
    ),
    TabItem(
      ImageConstants.chatIcon,
      "Chats",
      ColorSchema.primaryColor,
      labelStyle:
          const TextStyle().semiBold12.textColor(ColorSchema.whiteColor),
    ),
    TabItem(
      ImageConstants.profileIcon,
      "Profile",
      ColorSchema.primaryColor,
      labelStyle:
          const TextStyle().semiBold12.textColor(ColorSchema.whiteColor),
    ),
  ]);
  @override
  void onInit() {
    super.onInit();
    isFromRegister = false;
  }
}
