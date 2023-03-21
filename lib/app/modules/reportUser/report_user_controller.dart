import 'package:brain_heart/app/data/models/custom_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReportUserControoler extends GetxController {
  List<CustomIntroModel> reasonList = [
    CustomIntroModel(title: "Rude"),
    CustomIntroModel(title: "Spam"),
    CustomIntroModel(title: "Fake account"),
    CustomIntroModel(title: "Bot"),
    CustomIntroModel(title: "Other"),
  ];
  TextEditingController otherReason = TextEditingController();
  FocusNode otherNode = FocusNode();
}
