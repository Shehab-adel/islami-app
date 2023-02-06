import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../providers/AppConfigProvider.dart';
import 'HadethNameWidget.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({Key? key}) : super(key: key);

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    if (allHadethItems.isEmpty) loadHadethFile();
    return Column(
      children: [
        Expanded(
            flex: 1, child: Image.asset('assets/images/hadeth_top_logo.png')),
        Expanded(
          flex: 3,
          child: allHadethItems.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (buildContext, index) {
                    return HadethNameWidget(allHadethItems[index]);
                  },
                  itemCount: allHadethItems.length,
                  separatorBuilder: (buildContext, index) {
                    return Container(
                      height: 2,
                      color: provider.isDarkMode
                          ? MyThemeData.accentColorDark
                          : MyThemeData.primaryColor,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                    );
                  },
                ),
        )
      ],
    );
  }

  List<HadethItem> allHadethItems = [];

  void loadHadethFile() async {
    List<HadethItem> allHadethData = [];
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadeth = fileContent.split('#\r\n');

    for (int i = 0; i < allAhadeth.length; i++) {
      List<String> singleHadethContent = allAhadeth[i].split('\n');
      String title = singleHadethContent[0];
      String content = '';
      for (int j = 1; j < singleHadethContent.length; j++) {
        content += singleHadethContent[j] + ' ';
      }
      HadethItem item = HadethItem(title, content);
      allHadethData.add(item);
    }
    allHadethItems = allHadethData;
    setState(() {});
  }
}

class HadethItem {
  String title;
  String content;

  HadethItem(this.title, this.content);
}
