import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/home/presentation/widgets/today_varse_card_page_view_content.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

class TodayVarseCardSlidble
    extends StatefulWidget {
  const TodayVarseCardSlidble({super.key});

  @override
  State<TodayVarseCardSlidble> createState() =>
      _TodayVarseCardSlidbleState();
}

class _TodayVarseCardSlidbleState
    extends State<TodayVarseCardSlidble> {
  int dotsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).ayatToday,
                style:
                    AppFontStyles.styleBold16(
                      context,
                    ).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              Text(
                S.of(context).soraAlfateha,
                style:
                    AppFontStyles.styleBold16(
                      context,
                    ).copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.heightPercent(context),
        ),
        SizedBox(
          height: 20.heightPercent(context),
          child: PageView.builder(
            reverse: true,
            onPageChanged: (value) {
              setState(() {
                dotsIndex = value;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return TodayVarseCardPageViewContent(
                index: index,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: List.generate(3, (index) {
              int reverseIndex = 2 - index;
              return AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20),
                  color: dotsIndex == reverseIndex
                      ? Theme.of(
                          context,
                        ).colorScheme.primary
                      : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                ),
                margin:
                    const EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                duration: const Duration(
                  milliseconds: 300,
                ),
                width: dotsIndex == reverseIndex
                    ? 18
                    : 7,
                height: 7,
              );
            }),
          ),
        ),
      ],
    );
  }
}
