import 'package:al_minhaj/core/widgets/build_app_bar.dart';
import 'package:al_minhaj/features/drawer/pages/custom_drawer.dart';
import 'package:al_minhaj/features/home/presentation/widgets/prayer_time_card.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        searchBar: true,
        centerTitle: false,
        title: S.of(context).quran,
      ),
      drawer: CustomDrawer(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: PrayerTimeCard()),
        ],
      ),
    );
  }
}
