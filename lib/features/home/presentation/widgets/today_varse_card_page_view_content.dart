import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/home/presentation/widgets/today_verse_card_audio.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TodayVarseCardPageViewContent
    extends StatelessWidget {
  const TodayVarseCardPageViewContent({
    super.key,
    this.index = 0,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer,
        border: Border(
          left: BorderSide(
            color: Color(0xffFFB57D),
            width: 5.0,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
                  style:
                      AppFontStyles.styleBold16(
                        context,
                      ).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Iconsax.heart_add,
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimary,
                  size: 28,
                ),
              ),
            ],
          ),
          index == 0
              ? Expanded(child: Content1())
              : index == 1
              ? Content2()
              : TodayVerseCardAudio(),
          SizedBox(height: 2.heightPercent(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'سورة الفاتحة - الجزء الثلاثون  - آية ١',
                style:
                    AppFontStyles.styleRegular13(
                      context,
                    ).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Content2 extends StatelessWidget {
  const Content2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: TextDirection.rtl,
      'الثناء الكامل، وجميع أنواع المحامد من صفات الجلال والكمال هي لله وحده دون من سواه؛ إذ هو رب كل شيء وخالقه ومدبره.والعالمون جمع عالَم، وهم كل ما سوى الله تعالى.',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: AppFontStyles.styleBold12(context),
    );
  }
}

class Content1 extends StatelessWidget {
  const Content1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'All praise and thanks be to the Lord of the worlds',
      style: AppFontStyles.styleBold16(context),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
