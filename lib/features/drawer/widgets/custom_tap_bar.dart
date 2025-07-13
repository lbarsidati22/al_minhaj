import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:flutter/material.dart';

class CustomTapBar extends StatelessWidget {
  final String tab1Name;
  final String tab2Name;
  const CustomTapBar({
    super.key,
    required this.tab1Name,
    required this.tab2Name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.heightPercent(context),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.primary,
          borderRadius: BorderRadius.circular(13),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerHeight: 0,
          indicatorPadding:
              const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(
              context,
            ).colorScheme.onPrimary,
          ),
          unselectedLabelColor: Theme.of(
            context,
          ).colorScheme.onSecondaryContainer,
          labelPadding: const EdgeInsets.all(0),

          tabs: [
            Text(
              tab1Name,
              style:
                  AppFontStyles.styleSemiBold16(
                    context,
                  ).copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondaryContainer,
                  ),
            ),
            Text(
              tab2Name,
              style:
                  AppFontStyles.styleSemiBold16(
                    context,
                  ).copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
