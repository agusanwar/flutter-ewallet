import 'dart:convert';
import 'dart:io';

import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/models/signup_form_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetIDScreens extends StatefulWidget {
  final SignupFormModel data;
  const SignUpSetIDScreens({
    super.key,
    required this.data,
  });

  @override
  State<SignUpSetIDScreens> createState() => _SignUpSetIDScreensState();
}

class _SignUpSetIDScreensState extends State<SignUpSetIDScreens> {
  // Value
  XFile? selectedImage;
  // fntion
  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          // loading
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
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
                'Verify Your Account\n E-PAY',
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
                        'ID Card/SIM/Passport',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      color: kBlueDarkColor,
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthRegister(
                                  widget.data.copyWith(
                                    ktp: selectedImage == null
                                        ? null
                                        : 'data:image/png;base64,${base64Encode(
                                            File(selectedImage!.path)
                                                .readAsBytesSync(),
                                          )}',
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackbar(
                              context, 'Image Tidak Boleh Kosong');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextButton(
                      title: 'Skip for Now',
                      color: kBlackSoftColor,
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthRegister(
                                widget.data,
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
