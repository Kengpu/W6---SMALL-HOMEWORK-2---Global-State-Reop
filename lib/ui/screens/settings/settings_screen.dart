import 'package:flutter/material.dart';
 
import '../../../model/settings/app_settings.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';
import 'package:provider/provider.dart';
import 'package:homework2/ui/states/settings_state.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<AppSettingsState>();
    final currentTheme = settingsState.theme;
    return Container(
      color: currentTheme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Settings", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: theme == currentTheme,
                    onTap: (value) {
                       settingsState.changeTheme(value);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
