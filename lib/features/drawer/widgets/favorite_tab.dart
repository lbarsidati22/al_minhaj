import 'package:al_minhaj/core/cubit/settings/cubit/settings_cubit.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context
                    .read<SettingsCubit>()
                    .state
                    .language ==
                'ar'
            ? context
                  .read<SettingsCubit>()
                  .changeLanguage('en')
            : context
                  .read<SettingsCubit>()
                  .changeLanguage('ar');
      },
      leading: Icon(Icons.language),
      title: Text(S.of(context).language),
    );
  }
}
