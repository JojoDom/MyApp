import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:my_app/widgets/login_bottom_sheet.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                    ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  'Before Enjoying Foodmedia Services Please Register First',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomButton(
                  onTap: () {
                    LoginBottomSheet().login();
                  },
                  image: const SizedBox(),
                  text: 'Create Account',
                  isBusy: false),
              CustomButton(
                  onTap: () {
                     LoginBottomSheet().login();
                  },
                  image: SizedBox(),
                  text: 'Login',
                  isBusy: false),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text.rich(TextSpan(
                    text: 'By logging In or Registering, You have Agreed To ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                    children: [
                      TextSpan(
                          text: 'The Terms And Conditions ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.blue),
                          children: [
                            TextSpan(
                                text: 'And ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.blue),
                                  )
                                ])
                          ]),
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
