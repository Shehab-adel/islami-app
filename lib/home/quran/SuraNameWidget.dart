import 'package:flutter/material.dart';
import 'package:islami_online_c4/Home/quran/SuraDetailsScreen.dart';

// ignore: must_be_immutable
class SuraNameWidget extends StatelessWidget {
  String suraName;
  int index;

  SuraNameWidget(this.index, this.suraName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(index, suraName));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(suraName,
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.displayMedium),
      ),
    );
  }
}
