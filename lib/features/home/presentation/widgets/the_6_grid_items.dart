import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:flutter/material.dart';

class The6GridItems extends StatelessWidget {
  const The6GridItems({
    super.key,
    required this.gridItems,
    required this.index,
  });

  final List<Map<String, dynamic>> gridItems;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gridItems[index]['nav'] != null) {
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
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(gridItems[index]['icon']),
            SizedBox(height: 1.heightPercent(context)),
            Text(
              gridItems[index]['label'],
              style: AppFontStyles.styleBold13(context)
                  .copyWith(
                    color: AppTheme.isDark(context)
                        ? Colors.white
                        : Colors.black,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
