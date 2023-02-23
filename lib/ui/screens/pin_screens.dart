import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinScreens extends StatefulWidget {
  const PinScreens({super.key});

  @override
  State<PinScreens> createState() => _PinScreensState();
}

class _PinScreensState extends State<PinScreens> {
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '';
  // error type pin
  bool isError = false;

  // function reusable finction for pin
  addPin(String number) {
    // condition pin max 6
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
      // print(pinController.text);
    }
    // print(pinController.text);
    if (pinController.text.length == 6) {
      // verification pin
      if (pinController.text.length == 6 && pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        // text field pin error (danger text)
        setState(() {
          isError = true;
        });
        showCustomSnackbar(context, 'PIN yang anda masukan salah');
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isError = false;
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
      // print(pinController.text);
    }
  }

  // run for class pin
  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'PIN ACCESS',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      cursorColor: kGray2Color,
                      controller: pinController,
                      enabled: false,
                      style: grayTextStyle.copyWith(
                        fontSize: 36,
                        fontWeight: medium,
                        letterSpacing: 17,
                        color: isError ? kRedColor : kGrayColor,
                      ),
                      decoration: InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kGray2Color),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    children: [
                      CustomInputButton(
                        title: '1',
                        onTap: () {
                          addPin('1');
                        },
                      ),
                      CustomInputButton(
                        title: '2',
                        onTap: () {
                          addPin('2');
                        },
                      ),
                      CustomInputButton(
                        title: '3',
                        onTap: () {
                          addPin('3');
                        },
                      ),
                      CustomInputButton(
                        title: '4',
                        onTap: () {
                          addPin('4');
                        },
                      ),
                      CustomInputButton(
                        title: '5',
                        onTap: () {
                          addPin('5');
                        },
                      ),
                      CustomInputButton(
                        title: '6',
                        onTap: () {
                          addPin('6');
                        },
                      ),
                      CustomInputButton(
                        title: '7',
                        onTap: () {
                          addPin('7');
                        },
                      ),
                      CustomInputButton(
                        title: '8',
                        onTap: () {
                          addPin('8');
                        },
                      ),
                      CustomInputButton(
                        title: '9',
                        onTap: () {
                          addPin('9');
                        },
                      ),
                      const SizedBox(
                        width: 60,
                        height: 60,
                      ),
                      CustomInputButton(
                        title: '0',
                        onTap: () {
                          addPin('0');
                        },
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(21),
                        splashColor: kBlackSoftColor,
                        onTap: () {
                          deletePin();
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kBlackSoftColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
