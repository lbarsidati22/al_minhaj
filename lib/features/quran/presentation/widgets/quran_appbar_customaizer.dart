import 'package:al_minhaj/features/home/presentation/views/home_view.dart';
import 'package:al_minhaj/features/quran/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quran/quran.dart' as quran;

AppBar quranAppBar(
  BuildContext context, {
  int? surahNumber,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeView.routeName,
          (route) => false,
        );
      },
      child: Icon(Icons.arrow_back_ios),
    ),
    centerTitle: true,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: () {
          context
              .read<QuranCubit>()
              .changeSceneToList();
        },
        child: Row(
          children: [
            Icon(
              IconsaxPlusLinear.arrow_down,
              size: 30,
              weight: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "سورة ${quran.getSurahNameArabic(surahNumber ?? 1)}",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  'الجزء الأول - ٤/١ الحزب ٢',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
