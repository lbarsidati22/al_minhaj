import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        width: double.infinity,
        height: 10.heightPercent(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: BorderDirectional(
            start: BorderSide(
              width: 2,
              color: Color(0xFF2B2B2B),
            ),
          ),
          color: Color(0xFF2B2B2B),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/drawer_header.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).quran,
              style: AppFontStyles.styleSemiBold19(
                context,
              ).copyWith(color: Colors.white),
            ),
            Icon(
              Iconsax.arrow_right_1,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
