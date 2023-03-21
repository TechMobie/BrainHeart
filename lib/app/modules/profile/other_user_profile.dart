import 'package:brain_heart/components/common_header.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:brain_heart/schemata/color_schema.dart';
import 'package:brain_heart/schemata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherUserProfileScreen extends StatelessWidget {
  const OtherUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchema.offWhiteColor2,
      body: Column(
        children: [
          const CommonHeader(
            title: "Profile",
            isShowBackIcon: true,
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
                      _interestsWidget(),
                      _additionalInfoWidget(),
                      _addPhotoWidget(),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Photos",
                              style: const TextStyle()
                                  .semiBold20
                                  .textColor(ColorSchema.dark1),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Both users have to click on “Revel photos” in order to see them",
                              style: const TextStyle()
                                  .normal14
                                  .textColor(ColorSchema.dark1),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 12),
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
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Photos",
                              style: const TextStyle()
                                  .semiBold20
                                  .textColor(ColorSchema.dark1),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Still waiting for Robbin to revel photos",
                              style: const TextStyle()
                                  .normal14
                                  .textColor(ColorSchema.yellowColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
      child: Row(
        children: [
          Container(
            height: 96,
            width: 96,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorSchema.primaryColor,
              ),
              child: SvgPicture.asset(ImageConstants.avtar1),
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
                  style:
                      const TextStyle().semiBold24.textColor(ColorSchema.dark1),
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
    );
  }

  Widget _locationWidget() {
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
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Location",
            style: const TextStyle().semiBold20.textColor(ColorSchema.dark1),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Dyker Beach Golf Course",
            style:
                const TextStyle().normal13.textColor(ColorSchema.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _interestsWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Interests",
            style: const TextStyle().semiBold20.textColor(ColorSchema.dark1),
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
    );
  }

  Widget _additionalInfoWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Additional Info",
            style: const TextStyle().semiBold20.textColor(ColorSchema.dark1),
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
          Text(
            "Photos",
            style: const TextStyle().semiBold20.textColor(ColorSchema.dark1),
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                mainAxisExtent: 143,
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
          ),
        ],
      ),
    );
  }

  Widget _getPhotosState(int index) {
    if (index == 0) {
      return Center(child: SvgPicture.asset(ImageConstants.galleryIcon));
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        "https://api.uifaces.co/our-content/donated/xZ4wg2Xj.jpg",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
