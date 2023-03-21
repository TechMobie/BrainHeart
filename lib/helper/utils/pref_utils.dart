import 'package:brain_heart/helper/utils/common_functions.dart';
import 'package:get_storage/get_storage.dart';

class PrefUtils {
  static PrefUtils? _shared;

  PrefUtils._();

  static PrefUtils get getInstance => _shared = _shared ?? PrefUtils._();

  final _box = GetStorage();

  final credential = GetStorage();

  String get accessToken => "accessToken";

  writeData(String key, dynamic value) {
    _box.write(key, value);
  }

  readData(String key) {
    dynamic jsonData = _box.read(key);
    return jsonData;
  }

  bool isUserLogin() {
    final accessToken = readData(PrefUtils.getInstance.accessToken);
    return !isNullEmptyOrFalse(accessToken);
  }

  clearLocalStorage() async {
    await _box.erase();
  }

  removeStorage(String key) async {
    await _box.remove(key);
  }
}
