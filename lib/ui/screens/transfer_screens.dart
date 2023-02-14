import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:aipay/ui/widgets/form_widget.dart';
import 'package:aipay/ui/widgets/transfer_recent_user_item_widget.dart';
import 'package:aipay/ui/widgets/transfer_resault_user_item._widget.dart';
import 'package:flutter/material.dart';

class TransferScreens extends StatelessWidget {
  const TransferScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackSoftColor,
        centerTitle: true,
        title: Text(
          'Transfer Money',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBlackSoftColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Transfer',
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomFormField(
                    title: 'Find By Username',
                    isShowTitle: false,
                  ),
                  // Recent user
                  buildRecentUser(),
                  // buildResaultUser(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomFilledButton(
          title: 'Continue',
          color: kBlueDarkColor,
          onPressed: () {
            Navigator.pushNamed(context, '/transfer-amount');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildRecentUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent User',
            style: grayTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/images/logo.png',
            name: 'Angelica',
            username: 'angelica',
            isVerified: true,
            isSelected: true,
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/images/logo.png',
            name: 'Stevani',
            username: 'stevani',
          ),
          const TransferRecentUserItem(
            imageUrl: 'assets/images/logo.png',
            name: 'Andini',
            username: 'andini',
            isVerified: true,
          ),
        ],
      ),
    );
  }

  Widget buildResaultUser() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resault User',
            style: grayTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Wrap(
              spacing: 25,
              runSpacing: 10,
              children: const [
                TransferResaultUserItem(
                  imageUrl: 'assets/images/logo.png',
                  name: 'Zakisssssssssssssssssssssaaaaaaaaaaaaaaaaaaa',
                  username: 'zakia',
                  isVerifed: true,
                  isSelected: true,
                ),
                TransferResaultUserItem(
                  imageUrl: 'assets/images/logo.png',
                  name: 'Zakisssssssssssssssssssssaaaaaaaaaaaaaaaaaaa',
                  username: 'zakia',
                  isVerifed: true,
                  isSelected: true,
                ),
                TransferResaultUserItem(
                  imageUrl: 'assets/images/logo.png',
                  name: 'Zakia',
                  username: 'zakia',
                ),
                TransferResaultUserItem(
                  imageUrl: 'assets/images/logo.png',
                  name: 'Zakia',
                  username: 'zakia',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
