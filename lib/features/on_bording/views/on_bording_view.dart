import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/on_bording/widgets/custom_outline_botton.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routeName = "OnBordingView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3eadb),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Image.asset(
                  'assets/images/basmala.png',
                ),
              ),

              Image.asset(
                'assets/images/quran_book.png',
              ),
              SizedBox(
                height: 1.heightPercent(context),
              ),
              Text(
                S.of(context).applicationOfWorship,
                style:
                    AppFontStyles.styleRegular28(
                      context,
                    ).copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
              SizedBox(
                height: 1.heightPercent(context),
              ),
              Text(
                S.of(context).welcomeMessage,
                style:
                    AppFontStyles.styleBold16(
                      context,
                    ).copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
              ),
              SizedBox(
                height: 3.heightPercent(context),
              ),
              CustomOutlineBotton(),
            ],
          ),
        ),
      ),
    );
  }
}
