import 'package:aipay/models/user_model.dart';
import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;
  final bool isSelected;
  const TransferRecentUserItem({
    Key? key,
    required this.user,
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
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: user.profilePicture == null
                      ? const AssetImage('assets/images/img_dummy.png')
                      : NetworkImage(user.profilePicture!) as ImageProvider),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                user.name.toString().toUpperCase(),
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                '@${user.username.toString()}',
                style: grayTextStyle.copyWith(fontSize: 12),
              )
            ],
          ),
          const Spacer(),
          if (user.verified == 1)
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
