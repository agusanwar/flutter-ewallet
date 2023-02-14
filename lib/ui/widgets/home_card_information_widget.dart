import 'package:flutter/material.dart';

class HomeCardInformation extends StatelessWidget {
  final String imageUrl;

  const HomeCardInformation({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
