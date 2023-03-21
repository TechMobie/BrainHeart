import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackController extends GetxController {
  TextEditingController feedbackController = TextEditingController();
  FocusNode feedbackNode = FocusNode();
  RxString feedbackString = "".obs;
}
