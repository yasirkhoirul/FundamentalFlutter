import 'package:flutter/material.dart';
import 'package:sharedpreferences/model/settings.dart';
import 'package:sharedpreferences/service/shared_preference.dart';

class SharedPreferenceProvider extends ChangeNotifier {
  final SharedPreferenceService services;
  SharedPreferenceProvider(this.services);

  String _message = "";
  String get message => _message;

  Setting? _setting;

  Setting? get setting => _setting;

  Future getSetting() async {
    try {
      _setting = services.getSetting();
      _message = "data berhasil didapatkan";
    } catch (e) {
      _message = "terjadi kesalahan dalam pengambilan data";
    } finally {
      notifyListeners();
    }
  }

  Future saveSetting(Setting data) async {
    try {
      await services.saveSetting(data);
      _message = "data berhasil disimpan";
    } catch (e) {
      _message = "terjadi kesalhan ketika menyimpan data setting";
    } finally {
      notifyListeners();
    }
  }
}
