import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class Utiles {
  static bool isLogin = true;
  static bool onBoard = true;
  static bool start = true;
  static bool FirstOpen = true;
  static String token = '';
  static String name = '';
  static String UserId = '';
  static String email = '';
  static String phone = '';
  static String FCMToken = '';
  static String UserImage = '';
  static ThemeMode appMode = ThemeMode.light;
  // static List<String> flags = [
  //   'United States',
  //   'Japan',
  //   'France',
  //   'Egypt',
  //   'United Arab Emirate',
  //   'Suadi Arabia'
  // ];

  static void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}

extension dateTimeParsing on String {
  String parseDateTime() {
    var dateTime = DateTime.tryParse(this);

    var formate1 = "${dateTime?.day} -${dateTime?.month} -${dateTime?.year}";

    return formate1;
  }
}

String fastCalc({required double amount}) {
  MoneyFormatter fmf = MoneyFormatter(amount: amount);

  return fmf.output.nonSymbol;
}
