import 'dart:ui';

import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class SignUpSuccessScreens extends StatefulWidget {
  const SignUpSuccessScreens({super.key});

  @override
  State<SignUpSuccessScreens> createState() => _SignUpSuccessScreensState();
}

class _SignUpSuccessScreensState extends State<SignUpSuccessScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/rive/shapes.riv",
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: const SizedBox(),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child:
                        // Lottie.network(
                        //     'https://assets6.lottiefiles.com/packages/lf20_qnmccngh.json'),
                        Lottie.asset('assets/lottie/register-success.json'),
                  ),
                  Text(
                    'Register Completed',
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Grow your finance start\ntogether with us',
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomFilledButton(
                    title: 'Get Started',
                    width: 180,
                    color: kBlueDarkColor,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
