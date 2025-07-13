import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/core/widgets/to_arabic.dart';
import 'package:al_minhaj/features/quran/cubit/quran_cubit.dart';
import 'package:al_minhaj/features/quran/presentation/widgets/quran_appbar_customaizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;

class SuraListScreen extends StatelessWidget {
  const SuraListScreen({super.key});
  static const String routeName = 'suraListScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: quranAppBar(context),
      body: ListView.separated(
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, index) {
          final suraNumber = index + 1;
          return Material(
            child: ListTile(
              onTap: () {
                context
                    .read<QuranCubit>()
                    .changeSceneToPage(
                      surahNumber: suraNumber,
                    );
              },
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    convertToArabicNumerals(
                      suraNumber.toString(),
                    ),
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge,
                  ),
                ),
              ),
              title: Text(
                quran.getSurahNameArabic(suraNumber),
                style: Theme.of(
                  context,
                ).textTheme.displayLarge,
              ),
              subtitle: Text(
                'آياتها ${convertToArabicNumerals(quran.getVerseCount(suraNumber).toString())} - ${quran.getPlaceOfRevelation(suraNumber) == 'Madinah' ? 'مدنية' : 'مكية'}',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary,
                    ),
              ),
              trailing: Text(
                'الصفحة ${convertToArabicNumerals(quran.getPageNumber(suraNumber, 1).toString())}',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary,
                    ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 2.heightPercent(context),
          );
        },
      ),
    );
  }
}
