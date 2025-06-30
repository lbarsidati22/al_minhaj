import 'package:al_minhaj/core/routes/base_routes.dart';
import 'package:al_minhaj/features/home/presentation/views/home_view.dart';
import 'package:al_minhaj/features/on_bording/views/on_bording_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  // final args = settings.arguments;
  switch (settings.name) {
    case OnBordingView.routeName:
      return BaseRoute(page: const OnBordingView());
    case HomeView.routeName:
      return BaseRoute(page: HomeView());
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
