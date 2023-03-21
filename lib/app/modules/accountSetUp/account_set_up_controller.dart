import 'package:brain_heart/helper/utils/enum_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSetUpController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  final TextEditingController professionController = TextEditingController();
  final FocusNode professionFocusNode = FocusNode();

  final TextEditingController dateOfBirthController = TextEditingController();
  final FocusNode dateOfBirthFocusNode = FocusNode();

  Rx<Gender> gender = Rx<Gender>(Gender.male);
}


