import 'package:al_minhaj/features/quran/cubit/quran_cubit.dart';
import 'package:al_minhaj/features/quran/presentation/views/sura_list_screen.dart';
import 'package:al_minhaj/features/quran/presentation/widgets/quran_appbar_customaizer.dart';
import 'package:al_minhaj/features/quran/presentation/widgets/quran_sura_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;

class SuraDetailsScreen extends StatefulWidget {
  final int suraNumber;
  const SuraDetailsScreen({
    super.key,
    required this.suraNumber,
  });
  static const String routeName =
      'sura-details-screen';
  @override
  State<SuraDetailsScreen> createState() =>
      _SuraDetailsScreenState();
}

class _SuraDetailsScreenState
    extends State<SuraDetailsScreen> {
  bool hasUpperContent = true;
  @override
  Widget build(BuildContext context) {
    final int totalVerses = quran.getVerseCount(
      widget.suraNumber,
    );
    final int startPage = quran.getPageNumber(
      widget.suraNumber,
      1,
    );
    final int endPage = quran.getPageNumber(
      widget.suraNumber,
      totalVerses,
    );

    final Map<int, List<int>> versesByPage = {};
    for (
      int verseNumber = 1;
      verseNumber <= totalVerses;
      verseNumber++
    ) {
      final int pageNumber = quran.getPageNumber(
        widget.suraNumber,
        verseNumber,
      );
      if (!versesByPage.containsKey(pageNumber)) {
        versesByPage[pageNumber] = [];
      }
      versesByPage[pageNumber]!.add(verseNumber);
    }

    final List<int> pages = List.generate(
      endPage - startPage + 1,
      (index) => startPage + index,
    );

    return Scaffold(
      appBar: hasUpperContent
          ? quranAppBar(
              context,
              surahNumber: widget.suraNumber,
            )
          : null,
      body: GestureDetector(
        onTap: () {
          setState(() {
            hasUpperContent = !hasUpperContent;
          });
        },
        child: BlocConsumer<QuranCubit, QuranState>(
          listener: (context, state) {
            // if (state is ChangeSceneChangedToList) {
            //   Navigator.pushNamedAndRemoveUntil(
            //     context,
            //     SuraListScreen.routeName,
            //     (route) => false,
            //   );
            // } else {
            //   Navigator.pushNamed(
            //     context,
            //     SuraDetailsScreen.routeName,
            //   );
            // }
          },
          builder: (context, state) {
            if (state is ChangeSceneChangedToList) {
              return SuraListScreen();
            } else {
              return QuranSuraPageBuilder(
                pages: pages,
                versesByPage: versesByPage,
                surahNumber: widget.suraNumber,
              );
            }
          },
        ),
      ),
    );
  }
}
