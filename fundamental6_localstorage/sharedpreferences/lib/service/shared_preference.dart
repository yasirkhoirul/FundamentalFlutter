import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/model/settings.dart';
import 'package:sharedpreferences/utils/page_size_number.dart';

class SharedPreferenceService {
  final SharedPreferences _preference;

  SharedPreferenceService(this._preference);

  //1.buat keyberdasarkan model

  static const String _notifikasi = "notifikasi";
  static const String _pagenumber = "pagenumber";
  static const String _signature = "signature";
  //method memasukkan data
  Future saveSetting(Setting setting) async {
    try {
      await _preference.setBool(_notifikasi, setting.notificationEnable);
      await _preference.setInt(_pagenumber, setting.pagenumber);
      await _preference.setString(_signature, setting.signature);
    } catch (e) {
      throw Exception("shared cant saving the shared preferences");
    }
    //method mengambil data
  }

  Setting getSetting() {
    return Setting(
      notificationEnable: _preference.getBool(_notifikasi) ?? true,
      pagenumber: _preference.getInt(_pagenumber) ?? defaultPageSizeNumbers,
      signature: _preference.getString(_signature) ?? "",
    );
  }
}
