import 'package:get/get.dart';

class AdditionalInfoController extends GetxController {
  RxInt educationCurrentIndex = 0.obs;
  List<String> educationList = [
    "High School",
    "Bachelors",
    "Masters",
    "PhD",
    "Other",
    "Prefer not to say",
  ];

  RxInt religionCurrentIndex = 0.obs;
  List<String> religionList = [
    "Christian",
    "Muslim",
    "Hindu",
    "Sikh",
    "Jewish",
    "Buddhist",
    "Atheist",
    "Agnostic",
    "Other",
    "Prefer not to say",
  ];
  RxInt exerciseCurrentIndex = 0.obs;
  List<String> exerciseList = [
    "Regularly",
    "Sometimes",
    "Never",
    "Prefer not to say",
  ];
  RxInt alcoholCurrentIndex = 0.obs;
  RxInt smokingCurrentIndex = 0.obs;
  List<String> alcoholList = [
    "Yes",
    "No",
    "Occasionaly",
    "Prefer not to say",
  ];
}
