import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/drawer/widgets/custom_card.dart';
import 'package:al_minhaj/features/drawer/widgets/custom_tap_bar.dart';
import 'package:al_minhaj/features/drawer/widgets/favorite_tab.dart';
import 'package:al_minhaj/features/drawer/widgets/settings_tab.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final tabs = ['Favorites', 'Settings'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width / 1.1,
      child: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 28,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 2.heightPercent(context),
              ),
              CustomCard(),
              SizedBox(
                height: 2.heightPercent(context),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      CustomTapBar(),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SettingsTab(),
                            FavoriteTab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
