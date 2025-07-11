import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/pega_container.dart';
import 'package:al_minhaj/core/widgets/to_arabic.dart';
import 'package:al_minhaj/features/all_ad3ye/data/ad3ya_json.dart';
import 'package:flutter/material.dart';

class Ad3yePageContent extends StatelessWidget {
  final int index;
  const Ad3yePageContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ad3yaList[index]['title'],
                  style: AppFontStyles.styleBold16(context),
                ),
                Text(
                  '${convertToArabicNumerals(ad3yaList[index]['content'].length.toString())} أدعية',
                  style: AppFontStyles.styleBold16(context),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) {
                return PajeContainer(
                  text: ad3yaList[index]['content'][i],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: ad3yaList[index]['content'].length,
            ),
          ),
        ],
      ),
    );
  }
}
