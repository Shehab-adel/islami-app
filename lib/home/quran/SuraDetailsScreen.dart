import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_online_c4/utils.dart';
import 'VerseWidget.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  const SuraDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) readSura(args.index);
    return Stack(children: [
      imageAssetsBackground(context),
      Scaffold(
          appBar: AppBar(
            title: Text(args.name),
          ),
          body: container(listview, context))
    ]);
  }

  Widget get listview {
    return ayat.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemBuilder: (buildContext, index) {
              return VerseWidget(ayat[index], index);
            },
            itemCount: ayat.length,
          );
  }

  void readSura(int index) async {
    String fileName = 'assets/files/${index + 1}.txt';
    String fileContent = await rootBundle.loadString(fileName);
    List<String> verses = fileContent.split('\n');
    ayat = verses;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs(this.index, this.name);
}
