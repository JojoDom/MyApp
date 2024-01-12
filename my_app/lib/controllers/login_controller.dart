import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/dashboard.dart';

import '../utils/storage_keys.dart';

class LoginController extends GetxController {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var currentTab = 'Create'.obs;

  onTabSelect({required String tab}) {
    currentTab.value = tab;
    update();
  }

  login(
      {required String fullName,
      required String email,
      required String password}) async {
    await secureStorage.write(key: StorageKeys.ST_FULL_NAME, value: fullName);
    await secureStorage.write(key: StorageKeys.ST_EMAIL, value: email);
    await secureStorage.write(key: StorageKeys.ST_PASSWORD, value: password);

    Get.off(DashBoard());
  }
}
