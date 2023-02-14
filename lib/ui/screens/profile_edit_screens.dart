import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:flutter/material.dart';

class ProfileEditScreens extends StatelessWidget {
  const ProfileEditScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackSoftColor,
        centerTitle: true,
        title: Text(
          'Profie Edit',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kBlackSoftColor,
              ),
              // Parrent textfield
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username input
                  const CustomFormField(
                    title: 'Username',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Fullname input
                  const CustomFormField(
                    title: 'Fullname',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Email input
                  const CustomFormField(
                    title: 'Email Address',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Password input
                  const CustomFormField(
                    title: 'Password',
                    obsecureText: true,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomFilledButton(
                    title: 'Update Now',
                    color: kBlueDarkColor,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/profile-edit-success', (route) => false);
                    },
                  ),
                  const SizedBox(
                    height: 30,
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