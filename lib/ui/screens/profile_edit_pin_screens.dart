import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinScreens extends StatefulWidget {
  const ProfileEditPinScreens({super.key});

  @override
  State<ProfileEditPinScreens> createState() => _ProfileEditPinScreensState();
}

class _ProfileEditPinScreensState extends State<ProfileEditPinScreens> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');
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
                      // Old Pin input
                      CustomFormField(
                        title: 'Old Pin',
                        obsecureText: true,
                        controlller: oldPinController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // New PIN input
                      CustomFormField(
                        title: 'New Pin',
                        obsecureText: true,
                        controlller: newPinController,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      CustomFilledButton(
                        title: 'Update Now',
                        color: kBlueDarkColor,
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthUpdatePin(
                                  oldPinController.text,
                                  newPinController.text,
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
