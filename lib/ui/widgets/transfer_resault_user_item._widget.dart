import 'package:aipay/models/user_model.dart';
import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class TransferResaultUserItem extends StatelessWidget {
  final UserModel user;
  final bool isSelected;
  const TransferResaultUserItem({
    Key? key,
    required this.user,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kDarkBackgraundColor,
        border: Border.all(
          color: isSelected ? kBlueAccerColor : kDarkBackgraundColor,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: user.profilePicture == null
                      ? const AssetImage('assets/images/img_dummy.png')
                      : NetworkImage(user.profilePicture!) as ImageProvider),
            ),
            child: user.verified == 1
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kDarkBackgraundColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: kGreenColor,
                          size: 18,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            user.name.toString().toUpperCase(),
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '@${user.username}',
            style: grayTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
