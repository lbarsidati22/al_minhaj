import 'package:al_minhaj/features/al_mohadra/presentation/pages/al_mohadra_page.dart';
import 'package:al_minhaj/features/all_ad3ye/presentation/views/al_ad3ya_screen.dart';
import 'package:al_minhaj/features/azkar/presentation/views/azkar_screen.dart';
import 'package:al_minhaj/features/ahadith/presentation/views/ahadith_screen.dart';
import 'package:al_minhaj/features/quran/presentation/views/quran_screen.dart';
import 'package:al_minhaj/features/tesbih/presentation/views/tesbih_screen.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'the_6_grid_items.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridItems = [
      {
        'icon': 'assets/images/image 12.png',
        'label': S.of(context).supplications,
        'nav': AlAd3yaScreen.routeName,
      },
      {
        'icon': 'assets/images/image 8.png',
        'label': S.of(context).electronicRosary,
        'nav': TesbihScreen.routeName,
      },
      {
        'icon': 'assets/images/lectures_2.png',
        'label': S.of(context).lectures,
        'nav': AlMohadraPage.routeName,
      },
      {
        'icon': 'assets/images/image 16.png',
        'label': S.of(context).quran,
        'nav': QuranScreen.routeName,
      },
      {
        'icon': 'assets/images/image 7.png',
        'label': S.of(context).azkar,
        'nav': AzkarScreen.routeName,
      },
      {
        'icon': 'assets/images/image 10.png',
        'label': S.of(context).hadethname,
        'nav': AhadithScreen.routeName,
      },
    ];
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 24,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gridItems.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
        itemBuilder: (context, index) {
          return The6GridItems(
            gridItems: gridItems,
            index: index,
          );
        },
      ),
    );
  }
}
