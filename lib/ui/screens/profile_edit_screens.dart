import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/models/user_edit_form.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditScreens extends StatefulWidget {
  const ProfileEditScreens({super.key});

  @override
  State<ProfileEditScreens> createState() => _ProfileEditScreensState();
}

class _ProfileEditScreensState extends State<ProfileEditScreens> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    final authstate = context.read<AuthBloc>().state;
    if (authstate is AuthSuccess) {
      usernameController.text = authstate.user.username!;
      nameController.text = authstate.user.name!;
      emailController.text = authstate.user.email!;
      passwordController.text = authstate.user.password!;
    }
  }

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
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
                      CustomFormField(
                        title: 'Username',
                        controlller: usernameController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
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
                        height: 60,
                      ),
                      CustomFilledButton(
                        title: 'Update Now',
                        color: kBlueDarkColor,
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthUpdateUser(
                                  UserEditFormModel(
                                    username: usernameController.text,
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
