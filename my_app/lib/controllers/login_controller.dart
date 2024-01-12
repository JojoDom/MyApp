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

  checkDetails(
      {required String fullName,
      required String email,
      required String password}) async {
    var name = await secureStorage.read(key: StorageKeys.ST_FULL_NAME) ?? '';
    var email1 = await secureStorage.read(key: StorageKeys.ST_FULL_NAME) ?? '';
    var passwordnew =
        await secureStorage.read(key: StorageKeys.ST_FULL_NAME) ?? '';

    if (name != fullName || email1 != email || passwordnew != email) {
      Get.snackbar('', 'User Does not exist');
    } else {
      Get.offAll(const DashBoard());
    }
  }
}
