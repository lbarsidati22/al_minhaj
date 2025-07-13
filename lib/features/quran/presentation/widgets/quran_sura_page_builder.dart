import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/core/widgets/to_arabic.dart';
import 'package:al_minhaj/features/quran/presentation/widgets/chapter_header.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class QuranSuraPageBuilder extends StatelessWidget {
  final List<int> pages;
  final Map<int, List<int>> versesByPage;
  final int surahNumber;
  const QuranSuraPageBuilder({
    super.key,
    required this.pages,
    required this.versesByPage,
    required this.surahNumber,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: pages.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final pageNumber = pages[index];
        final verses = versesByPage[pageNumber] ?? [];
        final isFirstPage = index == 0;
        return SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 4.heightPercent(context),
                ),
                if (isFirstPage)
                  Column(
                    children: [
                      ChapterHeader(
                        surahNumber: surahNumber,
                      ),
                      SizedBox(
                        height: 2.heightPercent(
                          context,
                        ),
                      ),
                      surahNumber != 9 &&
                              surahNumber != 1
                          ? Image.asset(
                              'assets/images/basmala.png',
                              color:
                                  AppTheme.isDark(
                                    context,
                                  )
                                  ? Colors.white
                                  : null,

                              width: 250,
                            )
                          : const SizedBox(),
                    ],
                  ),

                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'UthmanicHafs',
                      fontSize: 23,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                    ),
                    children: [
                      ...verses.map((verseNumber) {
                        final verseText = quran
                            .getVerse(
                              surahNumber,
                              verseNumber,
                            );
                        final verseNumberArabic =
                            convertToArabicNumerals(
                              verseNumber.toString(),
                            );
                        return TextSpan(
                          text:
                              '$verseText $verseNumberArabic ',
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
