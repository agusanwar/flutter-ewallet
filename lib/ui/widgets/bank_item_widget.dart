import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSelected;
  const BankItem({
    super.key,
    required this.imageUrl,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                '15 Minutes',
                style: grayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
