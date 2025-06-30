import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.heightPercent(context),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(13),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerHeight: 0,
          indicatorPadding: const EdgeInsets.symmetric(
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
              S.of(context).settings,
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
              S.of(context).favorite,
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
