import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeFeaturedItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const HomeFeaturedItem({
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 55,
              height: 55,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kGrayColor.withOpacity(0.10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: color.withOpacity(0.1),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        imageUrl,
                        width: 27,
                      ),
                    ),
                  )
                ],
              )),
          Text(
            title,
            style: grayTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
