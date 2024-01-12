import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_app/controllers/login_controller.dart';
import 'package:my_app/widgets/create_account.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:my_app/widgets/login.dart';

import 'custom_formfield.dart';

class LoginBottomSheet {
  login() {
    showCupertinoModalBottomSheet(
        context: Get.context!,
        enableDrag: true,
        expand: false,
        isDismissible: true,
        topRadius: const Radius.circular(25),
        elevation: 25,
        backgroundColor: const Color(0xFFFFFEFE),
        builder: (context) => const LoginComponent());
  }
}

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  final _formKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Container(
            height: 15,
            width: 80,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 220, 215, 215),
                borderRadius: BorderRadius.circular(20)),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          loginController.onTabSelect(tab: 'Create');
                        },
                        child: Column(
                          children: [
                            const Text('Create Account'),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 5,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: loginController.currentTab == 'Create'
                                      ? Color.fromARGB(255, 171, 204, 232)
                                      : Colors.transparent,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          loginController.onTabSelect(tab: 'login');
                        },
                        child: Column(
                          children: [
                            const Text('Login'),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 5,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: loginController.currentTab == 'login'
                                      ? Color.fromARGB(255, 171, 204, 232)
                                      : Colors.transparent,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text('Full Name'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: CustomFormField(
                    controller: loginController.fullName,
                    hintText: 'Enter your full name',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text('Email Address'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: CustomFormField(
                    controller: loginController.email,
                    hintText: 'Eg xyc@gmail.com',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text('Password'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: CustomFormField(
                    controller: loginController.password,
                    hintText: '******',
                  ),
                ),
                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      loginController.login(
                          fullName: loginController.fullName.text,
                          email: loginController.email.text,
                          password: loginController.password.text);
                    }
                  },
                  image: SizedBox(),
                  text: 'Resgistration',
                  isBusy: false,
                  buttonColor: loginController.password.text.isEmpty
                      ? const Color.fromARGB(255, 224, 217, 217)
                      : Colors.lightBlue,
                ),
                CustomButton(
                  onTap: () {},
                  image: SizedBox(),
                  text: 'Sign up with Google',
                  isBusy: false,
                  buttonColor: Color.fromARGB(255, 224, 217, 217),
                )
              ],
            ),
          ),
        ));
  }
}
