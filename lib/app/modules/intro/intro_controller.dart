import 'package:brain_heart/app/data/models/custom_models.dart';
import 'package:brain_heart/helper/utils/images.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  RxInt currentPage = 0.obs;
  final List<CustomIntroModel> introList = [
    CustomIntroModel(
        title: "Chat first",
        subTitle:
            "We will present you with a small number of candidates ready to chat with",
        image: ImageConstants.intro1),
    CustomIntroModel(
        title: "Keep or Skip",
        subTitle:
            "After you reach a minimum number of exchanges, you vote to continue chatting or never interact again.",
        image: ImageConstants.intro2),
    CustomIntroModel(
        title: "Reval photos",
        subTitle:
            "After you both decide to continue you can choose to reveal photos to each other.",
        image: ImageConstants.intro3),
    CustomIntroModel(
        title: "Repeat",
        subTitle:
            "With each vote, we learn about your preferences and next time, we try to give you a better match.",
        image: ImageConstants.intro4),
  ];
}
