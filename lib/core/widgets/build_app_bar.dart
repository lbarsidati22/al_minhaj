import 'package:al_minhaj/core/settings/cubit/settings_cubit.dart';
import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
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
          ? widget // Use the provided widget directly
          : widget ??
                Text(
                  title ??
                      '', // Provide a default value if title is null
                  style: AppFontStyles.styleSemiBold22(
                    context,
                  ),
                ),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
          // context
          //             .read<SettingsCubit>()
          //             .state
          //             .language ==
          //         'ar'
          //     ? context
          //           .read<SettingsCubit>()
          //           .changeLanguage('en')
          //     : context
          //           .read<SettingsCubit>()
          //           .changeLanguage('ar');
        },
        icon: Icon(Iconsax.menu),
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          onPressed: () {
            if (searchBar) {
              //   print('search bar');
              // Handle search bar functionality
              context
                          .read<SettingsCubit>()
                          .state
                          .themeMode ==
                      ThemeMode.dark
                  ? context
                        .read<SettingsCubit>()
                        .changeTheme(ThemeMode.light)
                  : context
                        .read<SettingsCubit>()
                        .changeTheme(ThemeMode.dark);
            } else {
              Navigator.pop(context);
            }
          },
          icon: searchBar
              ? const Icon(Iconsax.search_normal_1)
              : SizedBox.shrink(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
}
