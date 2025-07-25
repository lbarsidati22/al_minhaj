import 'package:al_minhaj/core/cubit/all_media_cubit.dart';
import 'package:al_minhaj/core/routes/app_routes.dart'
    as AppRoutes;
import 'package:al_minhaj/core/services/shared_pref.dart';
import 'package:al_minhaj/core/cubit/settings/cubit/settings_cubit.dart';
import 'package:al_minhaj/core/cubit/settings/cubit/settings_state.dart';
import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:al_minhaj/core/utils/theme/font_family_helper.dart';
import 'package:al_minhaj/features/on_bording/views/on_bording_view.dart';
import 'package:al_minhaj/features/quran/cubit/quran_cubit.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:al_minhaj/navigation_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences.setMockInitialValues({});
  await AppPreferences.instantiatePreferences();

  final settingsCubit = SettingsCubit();
  await settingsCubit.loadSettings();

  runApp(
    BlocProvider.value(
      value: settingsCubit,
      child: const AlMinhag(),
    ),
  );
}

class AlMinhag extends StatelessWidget {
  const AlMinhag({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final GlobalKey<NavigatorState> navigatorKey =
    //     GlobalKey<NavigatorState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuranCubit(),
        ),
        BlocProvider(
          create: (context) => AllMediaCubit()
            ..getAudio()
            ..getVideos(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state.language == 'ar') {
            FontFamilyHelper.isArabic = true;
          } else {
            FontFamilyHelper.isArabic = false;
          }
          print('//${FontFamilyHelper.isArabic}');
          print(
            "FONT: ${FontFamilyHelper.getFontFamily(state.language)}",
          );
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'AlMinhag',
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:
                S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            locale: Locale(state.language),
            theme: AppTheme.lightTheme(
              state.language,
            ),
            darkTheme: AppTheme.darkTheme(
              state.language,
            ),
            themeMode: state.themeMode,
            onGenerateRoute:
                AppRoutes.onGenerateRoute,
            initialRoute: OnBordingView.routeName,
          );
        },
      ),
    );
  }
}
