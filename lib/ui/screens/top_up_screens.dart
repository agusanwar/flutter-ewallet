import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/blocs/payment_mathod/payment_mathod_bloc.dart';
import 'package:aipay/models/payment_method_model.dart';
import 'package:aipay/models/topup_form_model.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/top_up_amount_screens.dart';
import 'package:aipay/ui/widgets/bank_item_widget.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpScreens extends StatefulWidget {
  const TopUpScreens({super.key});

  @override
  State<TopUpScreens> createState() => _TopUpScreensState();
}

class _TopUpScreensState extends State<TopUpScreens> {
  PaymentMethodModel? selectedPaymentMathod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBlackSoftColor,
        title: Text(
          'Top Up',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How can you top up E PAY Balance',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kBlackSoftColor,
                      ),
                      child: Icon(
                        Icons.question_mark,
                        color: kYellowColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'My Wallet Card',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBlackSoftColor,
                ),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Row(
                        children: [
                          Image.asset(
                            'assets/icons/ic_plus_circle.png',
                            color: kBlueAccerColor,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // RegExp class
                                state.user.cardNumber!.replaceAllMapped(
                                    RegExp(r".{4}"),
                                    (match) => " ${match.group(0)}"),
                                style: whiteTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                state.user.name.toString(),
                                style: whiteTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Text(
                'Bank Transfer',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocProvider(
                create: (context) =>
                    PaymentMathodBloc()..add(PaymentMethodGet()),
                child: BlocBuilder<PaymentMathodBloc, PaymentMathodState>(
                  builder: (context, state) {
                    // if success
                    if (state is PaymentMathodSuccess) {
                      return Column(
                        children: state.paymentMethods.map((paymentMethod) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPaymentMathod = paymentMethod;
                              });
                            },
                            child: BankItem(
                              paymentMethod: paymentMethod,
                              isSelected:
                                  paymentMethod.id == selectedPaymentMathod?.id,
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Others',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: (selectedPaymentMathod != null)
          ? Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomFilledButton(
                title: 'Continue',
                color: kBlueDarkColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopUpAmountScreens(
                        data: TopUpFormModel(
                            paymentMethodCode: selectedPaymentMathod?.code),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
