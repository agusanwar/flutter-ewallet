import 'package:aipay/models/tips_model.dart';
import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final TipsModel tips;

  const HomeTipsItem({
    Key? key,
    required this.tips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool imageNull = false;
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kLightBackgraundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: imageNull == false
                ? SizedBox(
                    child: Image.asset(
                      'assets/images/404.png',
                      width: 30,
                    ),
                  )
                : Image.network(
                    tips.thumbnai.toString(),
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tips.title.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse(tips.url.toString()))) {
                      launchUrl(Uri.parse(tips.url.toString()));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kYellowColor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          tips.url.toString(),
                          style: blueTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
