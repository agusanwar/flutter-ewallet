import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final bool isSelected;
  final VoidCallback? onTap;
  const DataProviderItem({
    super.key,
    required this.imageUrl,
    required this.title,
    this.isSelected = false,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kBlackSoftColor,
          border: Border.all(
            width: 2,
            color: isSelected ? kBlueDarkColor : kBlackSoftColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imageUrl,
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  subTitle,
                  style: grayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
