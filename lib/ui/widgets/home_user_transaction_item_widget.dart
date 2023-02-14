import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class HomeUserTransactionItem extends StatelessWidget {
  final String imageUrl;
  final String username;
  const HomeUserTransactionItem({
    Key? key,
    // constuctor
    required this.imageUrl,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              username,
              style: grayTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
