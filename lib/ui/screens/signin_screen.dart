import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/models/signin_form_model.dart';
import 'package:aipay/models/signup_form_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreens extends StatefulWidget {
  const SignInScreens({super.key});

  @override
  State<SignInScreens> createState() => _SignInScreensState();
}

class _SignInScreensState extends State<SignInScreens> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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
                'Sign in and\naccess your finance',
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
                      controlller: passwordController,
                      obsecureText: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 8,
                          bottom: 30,
                        ),
                        child: Text(
                          'Forgot password',
                          style: grayTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                    CustomFilledButton(
                      title: 'Sign In',
                      color: kBlueDarkColor,
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  SignInFormModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackbar(
                              context, 'Semua Field Harus Diisi');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextButton(
                      title: 'Create New Account',
                      color: kBlackSoftColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-up');
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
