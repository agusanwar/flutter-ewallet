import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class HomeCardServicesItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const HomeCardServicesItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color.withOpacity(0.9),
            ),
            child: Center(
              child: Image.asset(
                imageUrl,
                color: kBlueDarkColor,
                width: 20,
              ),
            ),
          ),
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
