import 'package:brain_heart/app/modules/bottomBar/bottom_bar_controller.dart';
import 'package:brain_heart/app/modules/chat/all_chat_screen.dart';
import 'package:brain_heart/app/modules/profile/profile_screen.dart';
import 'package:brain_heart/app/modules/yourMatches/all_matches_screen.dart';
import 'package:brain_heart/components/bottom_nav_bar.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  final BottomBarController _bottomBarController =
      Get.put<BottomBarController>(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchema.whiteColor,
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index: _bottomBarController.currentPage.value,
              children: [
                AllMatchesScreen(),
                AllChatScreen(),
                const ProfileScreen(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircularBottomNavigation(
              _bottomBarController.tabItems,
              barBackgroundColor: ColorSchema.dark1,
              selectedIconColor: ColorSchema.whiteColor,
              barHeight: 75,
              circleSize: 62,
              iconsSize: 32,
              circleStrokeWidth: 3,
              backgroundBoxShadow: [
                BoxShadow(
                  offset: const Offset(0, 16),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: ColorSchema.primaryColor.withOpacity(0.4),
                )
              ],
              // normalIconColor: ColorSchema.,
              controller: _bottomBarController.navigationController,
              selectedCallback: (val) {
                _bottomBarController.currentPage.value = val ?? 0;
              },
            ),
          ),
        ],
      ),
    );
  }
}
