import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/blocs/transfer/transfer_bloc.dart';
import 'package:aipay/models/transfer_form_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransferAmountScreens extends StatefulWidget {
  final TransferFormModel data;
  const TransferAmountScreens({
    super.key,
    required this.data,
  });

  @override
  State<TransferAmountScreens> createState() => _TransferAmountScreensState();
}

class _TransferAmountScreensState extends State<TransferAmountScreens> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  // Fomrat Currency
  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text == '' ? '0' : text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  // function reusable finction for amount
  addAmount(String number) {
    // condition in text first default 0
    if (amountController.text == '0') {
      // replace number default
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
    // print(amountController.text);
  }

  // Delete number of amount
  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        // for callback nunmber default this 0
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
      // print(pinController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TransferBloc(),
        child: BlocConsumer<TransferBloc, TransferState>(
          listener: (context, state) {
            // failed
            if (state is TransferFailed) {
              showCustomSnackbar(context, state.e);
            }
            //success
            if (state is TransferSuccess) {
              // update amount in home
              if (!mounted) return;
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                            amountController.text.replaceAll('.', ''),
                          ) *
                          -1, // * -1 untuk convert menjadi pengurangan
                    ),
                  );
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/top-up-success', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'TOTAL AMOUNT',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Align(
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      cursorColor: kGray2Color,
                      controller: amountController,
                      enabled: false,
                      style: whiteTextStyle.copyWith(
                        fontSize: 36,
                        fontWeight: medium,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Text(
                          'Rp.',
                          style: whiteTextStyle.copyWith(
                            fontSize: 36,
                            fontWeight: medium,
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kGray2Color),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Align(
                  child: Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    children: [
                      CustomInputButton(
                        title: '1',
                        onTap: () {
                          addAmount('1');
                        },
                      ),
                      CustomInputButton(
                        title: '2',
                        onTap: () {
                          addAmount('2');
                        },
                      ),
                      CustomInputButton(
                        title: '3',
                        onTap: () {
                          addAmount('3');
                        },
                      ),
                      CustomInputButton(
                        title: '4',
                        onTap: () {
                          addAmount('4');
                        },
                      ),
                      CustomInputButton(
                        title: '5',
                        onTap: () {
                          addAmount('5');
                        },
                      ),
                      CustomInputButton(
                        title: '6',
                        onTap: () {
                          addAmount('6');
                        },
                      ),
                      CustomInputButton(
                        title: '7',
                        onTap: () {
                          addAmount('7');
                        },
                      ),
                      CustomInputButton(
                        title: '8',
                        onTap: () {
                          addAmount('8');
                        },
                      ),
                      CustomInputButton(
                        title: '9',
                        onTap: () {
                          addAmount('9');
                        },
                      ),
                      const SizedBox(
                        width: 60,
                        height: 60,
                      ),
                      CustomInputButton(
                        title: '0',
                        onTap: () {
                          addAmount('0');
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          deleteAmount();
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
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  color: kBlueDarkColor,
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      if (!mounted) return;
                      final authState = context.read<AuthBloc>().state;

                      String pin = '';
                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }
                      if (!mounted) return;
                      context.read<TransferBloc>().add(
                            TransferPost(
                              widget.data.copyWith(
                                pin: pin,
                                amount:
                                    amountController.text.replaceAll('.', ''),
                              ),
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextButton(
                  title: 'Term & Condition',
                  color: kDarkBackgraundColor,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
