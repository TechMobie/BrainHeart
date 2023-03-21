import 'package:brain_heart/app/data/models/custom_models.dart';
import 'package:get/get.dart';

class ChooseYourInterestController extends GetxController {
  final List<CustomIntroModel> sportsList = [
    CustomIntroModel(title: "Football"),
    CustomIntroModel(title: "Volleyball"),
    CustomIntroModel(title: "Basketball"),
    CustomIntroModel(title: "Handball"),
    CustomIntroModel(title: "Gym"),
    CustomIntroModel(title: "Callisthenic"),
    CustomIntroModel(title: "Formula 1"),
    CustomIntroModel(title: "Dancing"),
    CustomIntroModel(title: "Rowing"),
    CustomIntroModel(title: "Swimming"),
    CustomIntroModel(title: "Other"),
  ];
  final List<CustomIntroModel> booksList = [
    CustomIntroModel(title: "Harry Potter"),
    CustomIntroModel(title: "Lord of the Rings"),
    CustomIntroModel(title: "Discworld"),
    CustomIntroModel(title: "Twilight"),
    CustomIntroModel(title: "Sci-Fi"),
    CustomIntroModel(title: "Fantasy"),
    CustomIntroModel(title: "Non-Fiction"),
    CustomIntroModel(title: "True Crime"),
    CustomIntroModel(title: "Science"),
    CustomIntroModel(title: "Other"),
  ];
  final List<CustomIntroModel> musicList = [
    CustomIntroModel(title: "Popr"),
    CustomIntroModel(title: "Rock"),
    CustomIntroModel(title: "Hip-Hop"),
    CustomIntroModel(title: "Latin"),
    CustomIntroModel(title: "Dance/Electronic"),
    CustomIntroModel(title: "R&B"),
    CustomIntroModel(title: "COuntry"),
    CustomIntroModel(title: "Folk"),
    CustomIntroModel(title: "Classical"),
    CustomIntroModel(title: "Metal"),
    CustomIntroModel(title: "Jazz"),
    CustomIntroModel(title: "New age"),
    CustomIntroModel(title: "Vlues"),
    CustomIntroModel(title: "Traditional"),
  ];
}
