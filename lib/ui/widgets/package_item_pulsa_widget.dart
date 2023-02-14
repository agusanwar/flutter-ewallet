import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class PackageItemPulsa extends StatelessWidget {
  final String title;
  final String subTitle;
  final int price;
  final bool isSelected;

  const PackageItemPulsa({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
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
            title,
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
            formatCurrency(price),
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
