import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController chatTextController = TextEditingController();

  RxList<String> messages = <String>[].obs;
  RxList<String> options = <String>[
    "Very Short",
    "Short",
    "Just Fine",
    "Long",
    "Very Long",
  ].obs;

  int testIndex = 0;

  ScrollController scrollController = ScrollController();
}
