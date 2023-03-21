import 'package:brain_heart/helper/utils/enum_utils.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PartnerPreferencesController extends GetxController {
  Rx<Gender> gender = Rx<Gender>(Gender.male);
  RxDouble distance = 0.0.obs;
  Rx<SfRangeValues> values = Rx<SfRangeValues>(const SfRangeValues(40.0, 80.0));
}
