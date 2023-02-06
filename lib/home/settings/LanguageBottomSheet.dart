import 'package:flutter/material.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:islami_online_c4/utils.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LanguageBottomSheet extends StatelessWidget {
  late AppConfigProvider provider;

  LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode ? Colors.black26 : Colors.white,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedItemWidget('English', context)
                : getUnselectedWidget('English', context),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget('العربية', context)
                : getUnselectedWidget('العربية', context),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text, BuildContext context) {
    return selectedAndUnSelectedPadding(text, context,
        widget: const Icon(
          Icons.check,
        ));
  }

  Widget getUnselectedWidget(String text, BuildContext context) {
    return selectedAndUnSelectedPadding(text, context);
  }
}
