import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String username;
  final bool isVerified;
  final bool isSelected;
  const TransferRecentUserItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.username,
    this.isVerified = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kDarkBackgraundColor,
        border: Border.all(
          color: isSelected ? kBlueAccerColor : kDarkBackgraundColor,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                name,
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                '@$username',
                style: grayTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          const Spacer(),
          if (isVerified)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: kGreenColor,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'verified',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: kGreenColor,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
