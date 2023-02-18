import 'package:flutter/material.dart';

Color lightColor = const Color(0xFFFFE3B8);
// Color accentColor = const Color(0xFF37715B);
Color accentColor = Colors.lightBlue;
Color darkColor = Colors.blue;
// Color darkColor = const Color(0xFF2E5043);

goToPage(BuildContext context, Widget destination, {bool clearStack = false}) {
  if (clearStack) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => destination), (route) => false);
  }
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => destination));
}

getHeight(context) => MediaQuery.of(context).size.height;
getWidth(context) => MediaQuery.of(context).size.width;
