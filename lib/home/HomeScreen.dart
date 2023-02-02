import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_online_c4/home/hadeth/HadethTab.dart';
import 'package:islami_online_c4/home/quran/QuranTab.dart';
import 'package:islami_online_c4/home/radio/RadioTab.dart';
import 'package:islami_online_c4/home/settings/SettingsTab.dart';
import 'package:islami_online_c4/home/tasbeh/TasbehTab.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.isDarkMode
              ? 'assets/images/main_background_dark.png'
              : 'assets/images/main_background.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/ic_quran.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/ic_hadeth.png')),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/ic_sebha.png')),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/ic_radio.png')),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: Container(
            child: views[currentIndex],
          ),
        ),
      ],
    );
  }

  List<Widget> views = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    const RadioTab(),
    const SettingsTab(),
  ];
}
