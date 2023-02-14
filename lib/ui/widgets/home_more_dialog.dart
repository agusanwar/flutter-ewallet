import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/home_featured_service_item_widget.dart';
import 'package:flutter/material.dart';

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kDarkBackgraundColor,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kDarkBackgraundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'More With Featured',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Wrap(
                spacing: 25,
                runSpacing: 25,
                children: [
                  HomeFeaturedItem(
                    imageUrl: 'assets/illustration/il_bpjs.svg',
                    title: 'Food',
                    color: kYellowColor,
                    onTap: () {},
                  ),
                  HomeFeaturedItem(
                    imageUrl: 'assets/illustration/il_bpjs.svg',
                    title: 'Pascabayar',
                    color: kGreenColor,
                    onTap: () {},
                  ),
                  HomeFeaturedItem(
                    imageUrl: 'assets/illustration/il_bpjs.svg',
                    title: 'Movie',
                    color: kBlueColor,
                    onTap: () {},
                  ),
                  HomeFeaturedItem(
                    imageUrl: 'assets/illustration/il_bpjs.svg',
                    title: 'Angsuran Kredit',
                    color: kOrangeColor,
                    onTap: () {},
                  ),
                  HomeFeaturedItem(
                    imageUrl: 'assets/illustration/il_bpjs.svg',
                    title: 'Telkom',
                    color: kRedColor,
                    onTap: () {},
                  ),
                  HomeFeaturedItem(
                    imageUrl: 'assets/illustration/il_bpjs.svg',
                    title: 'Pendidikan',
                    color: kRedColor,
                    onTap: () {},
                  ),
                  HomeFeaturedItem(
                    imageUrl: 'assets/illustration/il_bpjs.svg',
                    title: 'Voucher Game',
                    color: kRedColor,
                    onTap: () {},
                  ),
                  HomeFeaturedItem(
                    imageUrl: 'assets/illustration/il_bpjs.svg',
                    title: 'Donasi',
                    color: kRedColor,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
