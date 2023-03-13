import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/blocs/operator_card/operator_card_bloc.dart';
import 'package:aipay/models/operator_card_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/provider_package_item_screens.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/data_provider_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProvideriItemScreens extends StatefulWidget {
  const ProvideriItemScreens({
    super.key,
  });

  @override
  State<ProvideriItemScreens> createState() => _ProvideriItemScreensState();
}

class _ProvideriItemScreensState extends State<ProvideriItemScreens> {
  OperatorCardModel? selectedOperatorCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBlackSoftColor,
        title: Text(
          'Pulsa Data',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kBlackSoftColor,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/img_card.png',
                    width: 80,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthSuccess) {
                        return Column(
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
                            Row(
                              children: [
                                Text(
                                  state.user.name.toString().toUpperCase(),
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'balance ${formatCurrency(state.user.balance ?? 0)}',
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
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                'Select Provider',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  BlocProvider(
                    create: (context) =>
                        OperatorCardBloc()..add(OperatorCardGet()),
                    child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
                      builder: (context, state) {
                        if (state is OperatorCardSuccess) {
                          return Column(
                            children: state.operatorCards.map((operatorCard) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedOperatorCard = operatorCard;
                                  });
                                },
                                child: DataProviderItem(
                                  operatorCard: operatorCard,
                                  isSelected: operatorCard.id ==
                                      selectedOperatorCard?.id,
                                ),
                              );
                            }).toList(),
                          );
                        }
                        return Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: kBlueDarkColor,
                            size: 30,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: (selectedOperatorCard != null)
          ? Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomFilledButton(
                title: 'Continue',
                color: kBlueDarkColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProviderPackageItemScreens(
                        operatorCard: selectedOperatorCard!,
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
