import 'package:brain_heart/app/routes/app_pages.dart';
import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/helper/utils/pref_utils.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchema.offWhiteColor2,
      body: Column(
        children: [
          const CommonHeader(
            title: "Profile",
            isShowBackIcon: false,
          ),
          Expanded(
            child: ListView(
              cacheExtent: MediaQuery.of(context).size.height * 2,
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      _profileDetailsWidget(),
                      _locationWidget(),
                      _lookingForWidget(),
                      _interestsWidget(),
                      _additionalInfoWidget(),
                      _addPhotoWidget(),
                      _feedbackLogoutDeleteWidget(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _profileDetailsWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 10, top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorSchema.whiteColor,
      ),
      child: Stack(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.selectAvatarScreen);
                },
                child: Container(
                  height: 96,
                  width: 96,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(color: ColorSchema.primaryColor)),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorSchema.primaryColor,
                    ),
                    child: SvgPicture.asset(ImageConstants.avtar1),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: const TextStyle()
                          .semiBold24
                          .textColor(ColorSchema.dark1),
                    ),
                    Text(
                      "Artist, 16 July, Male",
                      style: const TextStyle()
                          .normal14
                          .textColor(ColorSchema.primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.accountSetUpScreen);
              },
              child: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                    color: const Color(0xff0C1339).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: SvgPicture.asset(ImageConstants.editIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.toNamed(Routes.locationScreen);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style:
                      const TextStyle().semiBold20.textColor(ColorSchema.dark1),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Dyker Beach Golf Course",
                  style: const TextStyle()
                      .normal13
                      .textColor(ColorSchema.primaryColor),
                ),
              ],
            ),
            SvgPicture.asset(ImageConstants.arrowRightIcon)
          ],
        ),
      ),
    );
  }

  Widget _lookingForWidget() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.partnerPreferencesScreen);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Looking for",
                  style:
                      const TextStyle().semiBold20.textColor(ColorSchema.dark1),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SvgPicture.asset(ImageConstants.maleIcon,
                        height: 18, width: 18, color: ColorSchema.primaryColor),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Female",
                      style: const TextStyle()
                          .normal13
                          .textColor(ColorSchema.primaryColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 16,
                      child: VerticalDivider(
                        width: 1,
                        color: ColorSchema.dark1.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(ImageConstants.calendar,
                        height: 18, width: 18, color: ColorSchema.primaryColor),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "51-90",
                      style: const TextStyle()
                          .normal13
                          .textColor(ColorSchema.primaryColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 16,
                      child: VerticalDivider(
                        width: 1,
                        color: ColorSchema.dark1.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      ImageConstants.locationIcon,
                      height: 18,
                      width: 18,
                      color: ColorSchema.primaryColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "<70 km",
                      style: const TextStyle()
                          .normal13
                          .textColor(ColorSchema.primaryColor),
                    ),
                  ],
                )
              ],
            ),
            SvgPicture.asset(ImageConstants.arrowRightIcon)
          ],
        ),
      ),
    );
  }

  Widget _interestsWidget() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.chooseYourInterestScreen);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Interests",
                  style:
                      const TextStyle().semiBold20.textColor(ColorSchema.dark1),
                ),
                SvgPicture.asset(ImageConstants.arrowRightIcon)
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Volleyball",
                    style: const TextStyle()
                        .normal13
                        .textColor(ColorSchema.primaryColor),
                  )
                ],
                text: "Sports: ",
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Discworld",
                    style: const TextStyle()
                        .normal13
                        .textColor(ColorSchema.primaryColor),
                  )
                ],
                text: "Books: ",
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hip-Hop",
                    style: const TextStyle()
                        .normal13
                        .textColor(ColorSchema.primaryColor),
                  )
                ],
                text: "Music: ",
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _additionalInfoWidget() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.educationScreen);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Additional Info",
                  style:
                      const TextStyle().semiBold20.textColor(ColorSchema.dark1),
                ),
                SvgPicture.asset(ImageConstants.arrowRightIcon)
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "High School",
                    style: const TextStyle()
                        .normal13
                        .textColor(ColorSchema.primaryColor),
                  )
                ],
                text: "Education: ",
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Christian",
                    style: const TextStyle()
                        .normal13
                        .textColor(ColorSchema.primaryColor),
                  )
                ],
                text: "Religion: ",
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Sometimes",
                    style: const TextStyle()
                        .normal13
                        .textColor(ColorSchema.primaryColor),
                  )
                ],
                text: "Exercise: ",
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Yes",
                    style: const TextStyle()
                        .normal13
                        .textColor(ColorSchema.primaryColor),
                  )
                ],
                text: "Alcohol: ",
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "No",
                    style: const TextStyle()
                        .normal13
                        .textColor(ColorSchema.primaryColor),
                  )
                ],
                text: "Smoking: ",
                style: const TextStyle().normal14.textColor(ColorSchema.dark1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _addPhotoWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "(Up to 4)",
                  style:
                      const TextStyle().normal14.textColor(ColorSchema.dark1),
                )
              ],
              text: "Add Photos ",
              style: const TextStyle().semiBold20.textColor(ColorSchema.dark1),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                mainAxisExtent: MediaQuery.of(Get.context!).size.height / 4.8,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: ColorSchema.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: _getPhotosState(index),
              );
            },
          )
        ],
      ),
    );
  }

  Padding _feedbackLogoutDeleteWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Get.toNamed(Routes.feedBackScreen);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Send us Feedback",
                  style: const TextStyle()
                      .medium18
                      .textColor(ColorSchema.primaryColor),
                ),
                SvgPicture.asset(ImageConstants.feedbackIcon)
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: 0,
            endIndent: 0,
            height: 30,
            color: ColorSchema.dark1.withOpacity(0.1),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Get.offAllNamed(Routes.signInScreen);
              PrefUtils.getInstance.clearLocalStorage();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Log Out",
                  style:
                      const TextStyle().medium18.textColor(ColorSchema.dark1),
                ),
                SvgPicture.asset(ImageConstants.logoutIcon)
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: 0,
            endIndent: 0,
            height: 30,
            color: ColorSchema.dark1.withOpacity(0.1),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Get.toNamed(Routes.deleteAccountScreen);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delete Account",
                  style: const TextStyle()
                      .medium18
                      .textColor(ColorSchema.expression),
                ),
                SvgPicture.asset(ImageConstants.deleteIcon)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPhotosState(int index) {
    if (index == 0) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(ImageConstants.dottedLine),
            ),
          ),
          SvgPicture.asset(ImageConstants.galleryIcon),
        ],
      );
    } else if (index == 1) {
      return Center(
        child: Text(
          "Loading",
          style: const TextStyle().normal13.textColor(ColorSchema.primaryColor),
        ),
      );
    } else if (index == 2) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                "https://randomuser.me/api/portraits/men/97.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorSchema.dark1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Awaiting review",
                    style: const TextStyle()
                        .normal12
                        .textColor(ColorSchema.whiteColor),
                  )
                ],
              ),
            ),
          )
        ],
      );
    } else if (index == 3) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          "https://api.uifaces.co/our-content/donated/xZ4wg2Xj.jpg",
          fit: BoxFit.fitWidth,
        ),
      );
    }
    return Container();
  }
}
