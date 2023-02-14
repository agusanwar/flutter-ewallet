import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:flutter/material.dart';

class ProfileEditPinScreens extends StatelessWidget {
  const ProfileEditPinScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBlackSoftColor,
        title: Text(
          'Edit Pin',
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
                  // Old Pin input
                  const CustomFormField(
                    title: 'Old Pin',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // New PIN input
                  const CustomFormField(
                    title: 'New Pin',
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
