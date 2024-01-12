import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_app/widgets/create_account.dart';
import 'package:my_app/widgets/login.dart';

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
        builder: (context) => const  LoginComponent());
  }
}

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 15, width: 80, decoration: BoxDecoration(
                     color: const Color.fromARGB(255, 220, 215, 215),
                     borderRadius: BorderRadius.circular(20)
                   ),),
                   centerTitle: true,
        bottom: const PreferredSize(
           preferredSize:  Size.fromHeight(50),
        child:  TabBar(
          isScrollable: true,
          tabs: [
            Text('Create Account'),
             Text('Login')
          ],
          
        ), 
       ),
        ),
        body: TabBarView(
          children: [
            CreateAccount(),
            Login()

          ],
        )
      ),
    );
  }
}
