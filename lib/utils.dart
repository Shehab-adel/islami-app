import 'package:flutter/material.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

late AppConfigProvider provider;
Widget imageAssetsBackground(BuildContext context) {
  provider = Provider.of<AppConfigProvider>(context);
  return Image.asset(
    !provider.isDarkMode
        ? "assets/images/main_background.png"
        : 'assets/images/main_background_dark.png',
    fit: BoxFit.fill,
    width: double.infinity,
  );
}

Widget container(Widget widget, BuildContext context) {
  provider = Provider.of<AppConfigProvider>(context);
  return Container(
    decoration: BoxDecoration(
        color: provider.isDarkMode ? Colors.black45 : Colors.white,
        borderRadius: BorderRadius.circular(24)),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 13),
    child: widget,
  );
}

Padding selectedAndUnSelectedPadding(String text, BuildContext context,
    {Widget? widget}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor),
        ),
        widget ?? Container(),
      ],
    ),
  );
}
