import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/provider_package_item_screens.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/data_provider_item_widget.dart';
import 'package:flutter/material.dart';

class ProvideriItemScreens extends StatelessWidget {
  const ProvideriItemScreens({super.key});

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1202 1222 1111',
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
                            'Andini, ',
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'balance ${formatCurrency(120000)}',
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
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
                children: const [
                  DataProviderItem(
                    imageUrl: 'assets/images/img_telkomsel.png',
                    title: 'Telkomsel',
                    subTitle: 'active',
                    isSelected: true,
                  ),
                  DataProviderItem(
                    imageUrl: 'assets/images/img_telkomsel.png',
                    title: 'Telkomsel',
                    subTitle: 'active',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          color: kBlueDarkColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProviderPackageItemScreens(),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
