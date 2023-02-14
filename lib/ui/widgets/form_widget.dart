import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controlller;
  final bool isShowTitle;
  final TextInputType? keyBoardType;

  const CustomFormField({
    Key? key,
    // constuctor
    required this.title,
    this.obsecureText = false,
    this.controlller,
    this.isShowTitle = true,
    this.keyBoardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          keyboardType: keyBoardType,
          obscureText: obsecureText,
          controller: controlller,
          decoration: InputDecoration(
            hintText: !isShowTitle ? title : null,
            hintStyle: grayTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            fillColor: kWhiteColor,
            focusColor: kBlueColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: kGraySoftColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: kWhiteColor,
              ),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        )
      ],
    );
  }
}
