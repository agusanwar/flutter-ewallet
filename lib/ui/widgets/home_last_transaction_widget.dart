import 'package:aipay/shared/themes.dart';

import 'package:flutter/material.dart';

class HomeLastTransaction extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color color;
  final String time;
  final String value;
  const HomeLastTransaction({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.color,
    required this.time,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isShimmer = false;
    bool imageNull = false;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color.withOpacity(0.2),
              ),
              child: Center(
                child: imageNull == false
                    ? SizedBox(
                        child: Image.asset(
                          'assets/images/404.png',
                          width: 30,
                        ),
                      )
                    : Image.asset(
                        'assets/images/404.png',
                        width: 30,
                      ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isShimmer == true
                      ? SizedBox(
                          child: Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kGraySoftColor,
                            ),
                          ),
                        )
                      : Text(
                          title,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                  const SizedBox(
                    height: 2,
                  ),
                  isShimmer == true
                      ? Container(
                          height: 10,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kGraySoftColor,
                          ),
                        )
                      : Text(
                          time,
                          // DateFormat('MMM dd')
                          //     .format(transactions.createdAt ?? DateTime.now()),
                          style: grayTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                ],
              ),
            ),
            isShimmer == true
                ? Container(
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kGraySoftColor,
                    ),
                  )
                : Text(
                    value,
                    // formatCurrency(transactions.amount ?? 0,
                    //     symbol: transactions.transactionType!.action == 'cr'
                    //         ? '+ '
                    //         : '- '),
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                      color: kGreenColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
