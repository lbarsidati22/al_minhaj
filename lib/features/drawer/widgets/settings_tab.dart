import 'package:al_minhaj/features/drawer/widgets/settings_item.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> settingsList = [
      {
        'icon': Image.asset(
          'assets/images/Quraan.png',
          width: 35,
        ),
        'label': S.of(context).quran,
        'hasSwitch': false,
      },
      {
        'icon': const Icon(Iconsax.icon),
        'label': S.of(context).ahzab,
        'hasSwitch': false,
      },
      {
        'icon': const Icon(Iconsax.icon),
        'label': S.of(context).tafsir,
        'hasSwitch': false,
      },
      {
        'icon': const Icon(Iconsax.icon),
        'label': S.of(context).parts,
        'hasSwitch': false,
      },
      {
        'icon': const Icon(Iconsax.book),
        'label': S.of(context).prostrations,
        'hasSwitch': false,
      },
      {
        'icon': const Icon(Iconsax.icon),
        'label': S.of(context).kneeling,
        'hasSwitch': false,
      },
      {
        'icon': const Icon(Iconsax.home),
        'label': S.of(context).home,
        'hasSwitch': false,
      },
      {
        'icon': const Icon(Iconsax.moon),
        'label': 'تفعيل الوضع الليلي',
        'hasSwitch': true,
      },
      {
        'icon': const Icon(Iconsax.emoji_happy),
        'label': S.of(context).moreapps,
        'hasSwitch': false,
      },
      {
        'icon': const Icon(Iconsax.share),
        'label': S.of(context).sharetheapp,
        'hasSwitch': false,
      },
    ];
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      physics: NeverScrollableScrollPhysics(),
      itemCount: settingsList.length,
      itemBuilder: (BuildContext context, int index) {
        return SettingsItem(
          settingsList: settingsList,
          index: index,
        );
      },
    );
  }
}
