import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/AppConfigProvider.dart';

class VerseWidget extends StatelessWidget {
  String text;
  int index;
  late AppConfigProvider provider;
  VerseWidget(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text + ' {${index + 1}}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: provider.isDarkMode ? Colors.white : Colors.black,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
