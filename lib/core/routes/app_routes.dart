import 'package:al_minhaj/core/routes/base_routes.dart';
import 'package:al_minhaj/features/al_mohadra/presentation/pages/al_mohadra_page.dart';
import 'package:al_minhaj/features/all_ad3ye/presentation/views/al_ad3ya_screen.dart';
import 'package:al_minhaj/features/azkar/presentation/views/azkar_screen.dart';
import 'package:al_minhaj/features/ahadith/presentation/views/ahadith_screen.dart';
import 'package:al_minhaj/features/home/presentation/views/home_view.dart';
import 'package:al_minhaj/features/on_bording/views/on_bording_view.dart';
import 'package:al_minhaj/features/quran/presentation/views/sura_list_screen.dart';
import 'package:al_minhaj/features/quran/presentation/widgets/sura_details_screen.dart';
import 'package:al_minhaj/features/tesbih/presentation/views/tesbih_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  // final args = settings.arguments;
  switch (settings.name) {
    case OnBordingView.routeName:
      return BaseRoute(page: OnBordingView());
    case HomeView.routeName:
      return BaseRoute(page: HomeView());
    case AlAd3yaScreen.routeName:
      return BaseRoute(page: AlAd3yaScreen());
    case SuraListScreen.routeName:
      return BaseRoute(page: SuraListScreen());
    case AhadithScreen.routeName:
      return BaseRoute(page: AhadithScreen());
    case AzkarScreen.routeName:
      return BaseRoute(page: AzkarScreen());
    case TesbihScreen.routeName:
      return BaseRoute(page: TesbihScreen());
    case AlMohadraPage.routeName:
      return BaseRoute(page: AlMohadraPage());
    case SuraDetailsScreen.routeName:
      final int? suraNumber =
          settings.arguments as int?;
      return BaseRoute(
        page: SuraDetailsScreen(
          suraNumber: suraNumber ?? 1,
        ),
      );
    // case QuranDetails.routeName:
    //   final args =
    //       settings.arguments as Map<String, dynamic>;
    //   return BaseRoute(
    //     page: QuranDetails(
    //       title: args['title'],
    //       index: args['index'],
    //     ),
    //   );
    // case SignUpView.routeName:
    //   return BaseRoute(page: const SignUpView());
    // case HomeView.routeName:
    //   return BaseRoute(page: const HomeView());
    // case BestSellingView.routeName:
    //   return BaseRoute(
    //     page: const BestSellingView(),
    //   );
    default:
      return BaseRoute(
        page: Scaffold(
          body: Center(
            child: Text(
              'No route found ${settings.name}',
            ),
          ),
        ),
      );
  }
}
