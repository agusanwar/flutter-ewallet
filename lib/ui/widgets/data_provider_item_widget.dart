import 'package:aipay/models/operator_card_model.dart';
import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final OperatorCardModel operatorCard;
  final bool isSelected;
  final VoidCallback? onTap;

  const DataProviderItem({
    super.key,
    required this.operatorCard,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool imageNull = false;
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
            imageNull == false
                ? SizedBox(
                    child: Image.asset(
                      'assets/images/404.png',
                      width: 30,
                    ),
                  )
                : Image.network(
                    operatorCard.thumbnail.toString(),
                    height: 30,
                    fit: BoxFit.cover,
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  operatorCard.name.toString().toUpperCase(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  operatorCard.status.toString(),
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
