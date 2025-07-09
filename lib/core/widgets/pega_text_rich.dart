import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/to_arabic.dart';
import 'package:al_minhaj/features/azkar/model/azkar_model.dart';
import 'package:flutter/material.dart';

class ReachTextReqaa extends StatelessWidget {
  final AzkarModel? azkarModel;
  final int repeatCount;
  final bool isNum;
  final int num;

  const ReachTextReqaa({
    super.key,
    this.azkarModel,
    this.isNum = false,
    this.num = 0,
    required this.repeatCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          convertToArabicNumerals(repeatCount.toString()),
          style: AppFontStyles.styleRegular11(context),
        ),
        Text(
          ' مرات من أصل ',
          style: AppFontStyles.styleRegular11(context),
        ),

        Text(
          isNum
              ? convertToArabicNumerals(num.toString())
              : convertToArabicNumerals(
                  azkarModel!.repeat.toString(),
                ),
          style: AppFontStyles.styleRegular11(context),
        ),
      ],
    );
  }
}
