import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/all_ad3ye/presentation/views/al_ad3ya_screen.dart';
import 'package:al_minhaj/features/azkar/presentation/views/azkar_screen.dart';
import 'package:al_minhaj/features/hadith/presentation/views/ahadith_screen.dart';
import 'package:al_minhaj/features/quran/presentation/views/quran_screen.dart';
import 'package:al_minhaj/features/tesbih/presentation/views/tesbih_screen.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

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
        'icon': 'assets/images/image 17.png',
        'label': S
            .of(context)
            .TheMostBeautifulNamesofAllah,
        'nav': null,
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
        physics:
            const NeverScrollableScrollPhysics(),
        itemCount: gridItems.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (gridItems[index]['nav'] !=
                  null) {
                Navigator.pushNamed(
                  context,
                  gridItems[index]['nav']!,
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primaryContainer,
                borderRadius:
                    BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Image.asset(
                    gridItems[index]['icon'],
                  ),
                  SizedBox(
                    height: 1.heightPercent(
                      context,
                    ),
                  ),
                  Text(
                    gridItems[index]['label'],
                    style:
                        AppFontStyles.styleBold13(
                          context,
                        ).copyWith(
                          color:
                              AppTheme.isDark(
                                context,
                              )
                              ? Colors.white
                              : Colors.black,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
