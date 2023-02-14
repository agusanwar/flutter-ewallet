import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final Icon? icon;
  final Color? color;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.icon,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
              color: kWhiteColor,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: graySoftTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
