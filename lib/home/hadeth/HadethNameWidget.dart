import 'package:flutter/material.dart';
import 'HadethDetailsScreen.dart';
import 'package:islami_online_c4/home/hadeth/HadethTab.dart';

// ignore: must_be_immutable
class HadethNameWidget extends StatelessWidget {
  HadethItem item;

  HadethNameWidget(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: item);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          item.title,
          style: Theme.of(context).primaryTextTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
