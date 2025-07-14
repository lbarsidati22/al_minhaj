import 'package:al_minhaj/core/cubit/settings/cubit/settings_cubit.dart';
import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsItem extends StatefulWidget {
  const SettingsItem({
    super.key,
    required this.settingsList,
    required this.index,
  });
  final List settingsList;
  final int index;

  @override
  State<SettingsItem> createState() =>
      _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.settingsList[widget.index]['label'],
        maxLines: 1,
        softWrap: false,
        style: AppFontStyles.styleRegular20(context),
      ),
      trailing:
          widget.settingsList[widget
              .index]['hasSwitch']
          ? Switch(
              value: AppTheme.isDark(context),
              onChanged: (value) {
                if (value) {
                  context
                      .read<SettingsCubit>()
                      .changeTheme(ThemeMode.dark);
                } else {
                  context
                      .read<SettingsCubit>()
                      .changeTheme(ThemeMode.light);
                }
                setState(() {});
              },
              activeColor: Colors.green,
            )
          : null,
      leading:
          widget.settingsList[widget.index]['icon'],
    );
  }
}
