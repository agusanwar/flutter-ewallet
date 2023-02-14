import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    Key? key,
    // constuctor
    required this.title,
    required this.color,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  }) : super(key: key);

  final Color color;
  final double height;
  final VoidCallback? onPressed;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.title,
    required this.color,
    this.width = double.infinity,
    this.height = 40,
    this.onPressed,
  }) : super(key: key);

  final Color color;
  final double height;
  final VoidCallback? onPressed;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: Text(
          title,
          style: grayTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class CustomInputButton extends StatelessWidget {
  const CustomInputButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(21),
      splashColor: kBlackSoftColor,
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBlackSoftColor,
        ),
        child: Center(
          child: Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
