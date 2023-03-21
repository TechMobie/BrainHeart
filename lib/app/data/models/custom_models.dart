import 'package:get/get.dart';

class CustomIntroModel {
  String? title;
  String? subTitle;
  String? image;
  RxBool isSelected = false.obs;
  CustomIntroModel({this.title, this.subTitle, this.image});
}
