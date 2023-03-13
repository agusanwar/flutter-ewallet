import 'package:aipay/models/data_provider_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class PackageItemPulsa extends StatelessWidget {
  final DataProviderModel dataProvider;
  final String subTitle;
  final bool isSelected;

  const PackageItemPulsa({
    Key? key,
    required this.dataProvider,
    required this.subTitle,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBlackSoftColor,
        border: Border.all(
          width: 2,
          color: isSelected ? kBlueDarkColor : kBlackSoftColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dataProvider.name.toString().toUpperCase(),
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            subTitle,
            style: grayTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            formatCurrency(dataProvider.price ?? 0),
            style: yellowTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
