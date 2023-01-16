import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

enum TextStyleEnum {
  normal,
  title,
  caption,
}

class CustomText extends StatelessWidget {
  TextStyle getTextStyle(TextStyleEnum textStyleEnum,
      {Color? color,
      double? fontsize,
      String? fontFamily,
      TextOverflow? overflow,
      TextDecoration? decoration,
      FontWeight? weight,
      double? height,
      BuildContext? context}) {
    switch (textStyleEnum) {
      case TextStyleEnum.title:
        return TextStyle(
                height: height,
                fontSize: 25,
                color: AppColors.black,
                // fontFamily:
                //     context?.locale == Locale('ar', 'EG') ? "stc" : "grotley",
                fontWeight: FontWeight.w500)
            .copyWith(
                decoration: decoration,
                color: color ?? AppColors.black,
                fontWeight: weight,
                fontSize: fontsize,
                overflow: overflow ?? TextOverflow.visible,
                height: height,
                fontFamily: fontFamily);
      case TextStyleEnum.caption:
        return TextStyle(
                fontSize: 12,
                height: height,
                color: AppColors.black,
                // fontFamily:
                //     context?.locale == Locale('ar', 'EG') ? "stc" : "grotley",
                fontWeight: FontWeight.w300)
            .copyWith(
                decoration: decoration,
                color: color ?? AppColors.black,
                fontWeight: weight,
                fontSize: fontsize,
                height: height,
                overflow: overflow ?? TextOverflow.visible,
                fontFamily: fontFamily);

      default:
        return TextStyle(
                fontSize: 16,
                color: AppColors.black,
                height: height,
                // fontFamily:
                //     context?.locale == Locale('ar', 'EG') ? "stc" : "grotley",
                fontWeight: FontWeight.w500)
            .copyWith(
                decoration: decoration,
                color: color ?? AppColors.black,
                fontWeight: weight,
                fontSize: fontsize,
                height: height,
                overflow: overflow ?? TextOverflow.visible,
                fontFamily: fontFamily);
    }
  }

  const CustomText(
    this.text, {
    Key? key,
    this.textStyleEnum,
    this.color,
    this.fontsize,
    this.weight,
    this.fontFamily,
    this.align,
    this.decoration,
    this.overflow,
    this.height,
    this.textDirection,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final TextStyleEnum? textStyleEnum;
  final Color? color;
  final double? fontsize;
  final double? height;

  final String? fontFamily;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextAlign? align;
  final int? maxLines;
  final TextDirection? textDirection;
  final FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: align,
      // textDirection: context.locale == Locale('en', 'US')
      //     ? TextDirection.ltr
      // textDirection: textDirection ??
      //     ((context.locale == Locale('en', 'US'))
      //         ? TextDirection.ltr
      //         : TextDirection.rtl),
      style: getTextStyle(textStyleEnum ?? TextStyleEnum.normal,
          color: color,
          fontsize: fontsize,
          height: height,
          // fontFamily: fontFamily ?? context.locale == Locale('ar', 'EG')?"grotley": "stc",
          //    fontFamily: context.locale == Locale('ar', 'EG') ? "stc" : "grotley",
          overflow: overflow,
          decoration: decoration,
          weight: weight,
          context: context),
    );
  }
}
