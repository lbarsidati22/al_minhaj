import 'package:al_minhaj/core/settings/cubit/settings_cubit.dart';
import 'package:al_minhaj/core/settings/cubit/settings_state.dart';
import 'package:al_minhaj/features/home/presentation/widgets/home_app_bar.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/drawer/pages/custom_drawer.dart';
import 'package:al_minhaj/features/home/presentation/widgets/grid_view_item.dart';
import 'package:al_minhaj/features/home/presentation/widgets/prayer_time_card.dart';
import 'package:al_minhaj/features/home/presentation/widgets/today_varse_card_slidble.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: HomeCustomAppBar(
            centerTitle: false,
            title: S.of(context).quran,
          ),
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                PrayerTimeCard(),
                TodayVarseCardSlidble(),
                SizedBox(height: 2.heightPercent(context)),
                GridViewItem(),
              ],
            ),
          ),
        );
      },
    );
  }
}
