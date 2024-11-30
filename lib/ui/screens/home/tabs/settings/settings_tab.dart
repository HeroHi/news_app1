import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app1/main.dart';
import 'package:news_app1/utils/consts/app_colors.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(context.tr("language")),
          SizedBox(
            height: 18,
          ),
          DropdownButtonFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2))),
              value: context.locale.languageCode,
              isExpanded: true,
              items: [
                DropdownMenuItem(
                    value: "en",
                    child: Text(
                      "English",
                      style: theme.textTheme.displayMedium,
                    )),
                DropdownMenuItem(
                    value: "ar",
                    child:
                        Text("العربية", style: theme.textTheme.displayMedium))
              ],
              onChanged: (newValue) {
                context
                    .setLocale(Locale(newValue ?? context.locale.languageCode));
              })
        ],
      ),
    );
  }
}
