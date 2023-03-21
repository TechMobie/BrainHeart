import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MatchesController extends GetxController {
  TextEditingController chatTextController = TextEditingController();

  RxList<String> messages = <String>[].obs;
  ScrollController scrollController = ScrollController();
}
