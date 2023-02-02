import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_online_c4/home/settings/LanguageBottomSheet.dart';
import 'package:islami_online_c4/home/settings/ThemeBottomSheet.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: currentColor)),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en' ? "English" : "العربية",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: currentColor),
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.appTheme == ThemeMode.dark
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                  const Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }

  Color get currentColor {
    if (provider.isDarkMode) {
      return Colors.white;
    }
    return Colors.black;
  }
}
