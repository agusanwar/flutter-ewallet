import 'package:aipay/models/user_model.dart';
import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class HomeUserTransactionItem extends StatelessWidget {
  final UserModel userTransaction;
  const HomeUserTransactionItem({
    Key? key,
    // constuctor
    required this.userTransaction,
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
            Container(
              height: 45,
              width: 45,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: userTransaction.profilePicture == null
                      ? const AssetImage('assets/images/img_dummy.png')
                      : NetworkImage(
                          userTransaction.profilePicture!,
                        ) as ImageProvider,
                ),
              ),
            ),
            Text(
              '@${userTransaction.username}',
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
