import 'package:flutter/material.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:islami_online_c4/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ThemeBottomSheet extends StatelessWidget {
  late AppConfigProvider provider;

  ThemeBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode ? Colors.black26 : Colors.white,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.isDarkMode
                ? getUnselectedWidget(
                    AppLocalizations.of(context)!.light, context)
                : getSelectedItemWidget(
                    AppLocalizations.of(context)!.light, context),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDarkMode
                ? getSelectedItemWidget(
                    AppLocalizations.of(context)!.dark, context)
                : getUnselectedWidget(
                    AppLocalizations.of(context)!.dark, context),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text, BuildContext context) {
    return selectedAndUnSelectedPadding(text, context,
        widget: Icon(
          Icons.check,
        ));
  }

  Widget getUnselectedWidget(String text, BuildContext context) {
    return selectedAndUnSelectedPadding(text, context);
  }
}
