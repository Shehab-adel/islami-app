import 'package:flutter/material.dart';
import 'package:islami_online_c4/home/hadeth/HadethTab.dart';
import 'package:islami_online_c4/utils.dart';

// ignore: must_be_immutable
class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';
  late var args;

  HadethDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as HadethItem;
    return Stack(children: [
      imageAssetsBackground(context),
      Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: container(text, context))
    ]);
  }

  Widget get text {
    return SingleChildScrollView(
      child: Text(
        args.content,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: provider.isDarkMode ? Colors.white : Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
