import 'package:aipay/models/transaction_model.dart';
import 'package:aipay/shared/shared_method.dart';
import 'package:aipay/shared/themes.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLastTransaction extends StatelessWidget {
  final TransactionModel transaction;
  final Color color;
  const HomeLastTransaction({
    Key? key,
    required this.transaction,
    required this.color,
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
                    : Image.network(
                        transaction.transactionType!.thumbnail!,
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
                          transaction.transactionType!.name!,
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
                          DateFormat('MMM dd')
                              .format(transaction.createdAt ?? DateTime.now()),
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
                    formatCurrency(
                      transaction.amount ?? 0,
                      symbol: transaction.transactionType!.action == 'cr'
                          ? '+'
                          : '-',
                    ),
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                      color: transaction.transactionType!.action == 'cr'
                          ? kGreenColor
                          : kRedColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
