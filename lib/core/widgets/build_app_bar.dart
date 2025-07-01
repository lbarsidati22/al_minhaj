import 'package:al_minhaj/core/settings/cubit/settings_cubit.dart';
import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/class_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.searchBar = false,
    this.centerTitle = true,
    this.notTitle = false,
    this.widget,
  });

  final String? title;
  final bool searchBar;
  final bool centerTitle;
  final bool notTitle;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: centerTitle,
      title: notTitle
          ? widget
          : widget ??
                Text(
                  title ?? '',
                  style: AppFontStyles.styleSemiBold22(
                    context,
                  ),
                ),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Iconsax.menu),
      ),
      actions: [
        PopupMenuButton<Language>(
          onSelected: (Language language) {
            context
                .read<SettingsCubit>()
                .changeLanguage(language.code);
          },
          itemBuilder: (BuildContext context) {
            return Language.languageList().map((
              Language language,
            ) {
              return PopupMenuItem<Language>(
                value: language,
                child: Row(
                  children: [
                    Image.asset(
                      language.flagAsset,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Text(
                      language.name,
                      style: AppFontStyles.styleBold16(
                        context,
                      ),
                    ),
                  ],
                ),
              );
            }).toList();
          },
          icon: Icon(Icons.language),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
}
