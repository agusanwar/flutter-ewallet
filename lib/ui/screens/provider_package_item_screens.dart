import 'package:aipay/models/data_provider_model.dart';
import 'package:aipay/models/operator_card_model.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:aipay/ui/widgets/package_item_pulsa_widget.dart';
import 'package:flutter/material.dart';

class ProviderPackageItemScreens extends StatefulWidget {
  final OperatorCardModel operatorCard;
  const ProviderPackageItemScreens({
    super.key,
    required this.operatorCard,
  });

  @override
  State<ProviderPackageItemScreens> createState() =>
      _ProviderPackageItemScreensState();
}

class _ProviderPackageItemScreensState extends State<ProviderPackageItemScreens>
    with SingleTickerProviderStateMixin {
  final phoneController = TextEditingController(text: '');

  DataProviderModel? selectedDataProvider;

  late TabController tabController;
  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBlackSoftColor,
        title: Text(
          'Pulsa Data Package',
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
                top: 30,
              ),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kBlackSoftColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone Number',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    title: '+62',
                    isShowTitle: false,
                    controlller: phoneController,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kDarkBackgraundColor,
              ),
              child: Column(
                children: [
                  TabBar(
                    labelColor: kWhiteColor,
                    controller: tabController,
                    indicatorColor: kBlueDarkColor,
                    indicatorWeight: 2,
                    tabs: const [
                      Tab(
                        text: 'Isi Pulsa',
                      ),
                      Tab(
                        text: 'Paket Data',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: widget.operatorCard.dataProvider!
                            .map((dataProvider) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDataProvider = dataProvider;
                              });
                            },
                            child: PackageItemPulsa(
                              dataProvider: dataProvider,
                              subTitle: 'Harga',
                              isSelected:
                                  dataProvider.id == selectedDataProvider?.id,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: widget.operatorCard.dataProvider!
                            .map((dataProvider) {
                          return PackageItemPulsa(
                              dataProvider: dataProvider, subTitle: 'Harga');
                        }).toList(),
                      ),
                    ),
                  ),
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
            Navigator.pushNamedAndRemoveUntil(
                context, '/provider-payment-success', (route) => false);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
