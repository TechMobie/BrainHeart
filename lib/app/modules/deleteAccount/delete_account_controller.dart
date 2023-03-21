import 'package:brain_heart/app/data/models/custom_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  List<CustomIntroModel> reasonList = [
    CustomIntroModel(title: "I found somone on Brainheart"),
    CustomIntroModel(title: "I found somone elsewhere"),
    CustomIntroModel(title: "No one to chat with"),
    CustomIntroModel(title: "Too many ghosters"),
    CustomIntroModel(title: "Rude people"),
    CustomIntroModel(title: "Other"),
  ];
  TextEditingController otherReason = TextEditingController();
  FocusNode otherNode = FocusNode();
}
