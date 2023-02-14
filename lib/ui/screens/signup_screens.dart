import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/models/signup_form_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/signup_set_profile_screens.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  // Validasi data
  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // Failed State
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpUSetProfileScreens(
                  data: SignupFormModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
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
                'Join US My App Finance',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fullname input
                    CustomFormField(
                      title: 'Fullname',
                      controlller: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Email input
                    CustomFormField(
                      title: 'Email Address',
                      controlller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Password input
                    CustomFormField(
                      title: 'Password',
                      obsecureText: true,
                      controlller: passwordController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      color: kBlueDarkColor,
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthCheckEmail(emailController.text),
                              );
                        } else {
                          showCustomSnackbar(
                              context, 'Semua Data Harus Di isi');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextButton(
                      title: 'Sign In',
                      color: kBlackSoftColor,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/sign-in',
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
