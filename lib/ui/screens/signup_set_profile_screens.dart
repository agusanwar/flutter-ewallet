import 'dart:convert';
import 'dart:io';

import 'package:aipay/models/signup_form_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/signup_set_id_screens.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpUSetProfileScreens extends StatefulWidget {
  // get input data from register
  final SignupFormModel data;
  const SignUpUSetProfileScreens({
    super.key,
    required this.data,
  });

  @override
  State<SignUpUSetProfileScreens> createState() =>
      _SignUpUSetProfileScreensState();
}

class _SignUpUSetProfileScreensState extends State<SignUpUSetProfileScreens> {
  final pinController = TextEditingController(text: '');
  // vakue
  XFile? selectedImage;
  // funtion
  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // print(data.toJson());
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 60,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 155,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                ),
                Text(
                  'E PAY',
                  style: whiteTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Join to unlock\n E PAY',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kBlackSoftColor,
            ),
            // Parrent textfield
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kLightBackgraundColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(
                                  selectedImage!.path,
                                ),
                              ),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Image.asset(
                              'assets/icons/ic_upload.png',
                              width: 32,
                              color: kBlueDarkColor,
                            ),
                          ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 30,
                  ),
                  child: Text(
                    'Angelina Stevani',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
                // Set PIN input
                CustomFormField(
                  title: 'Set PIN (6 digit number)',
                  obsecureText: true,
                  controlller: pinController,
                  keyBoardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  color: kBlueDarkColor,
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSetIDScreens(
                            data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data/image/png;base64,${base64Encode(
                                      File(selectedImage!.path)
                                          .readAsBytesSync(),
                                    )}',
                            ),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackbar(context, 'PIN Harus diisi 6 Digit');
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
