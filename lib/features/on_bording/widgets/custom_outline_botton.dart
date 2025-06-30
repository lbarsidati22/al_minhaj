import 'package:al_minhaj/core/utils/theme/app_font_styles.dart';
import 'package:al_minhaj/core/widgets/sized_box.dart';
import 'package:al_minhaj/features/home/presentation/views/home_view.dart';
import 'package:al_minhaj/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomOutlineBotton extends StatelessWidget {
  const CustomOutlineBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.heightPercent(context),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.onSurface,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            HomeView.routeName,
          );
        },
        child: Text(
          S.of(context).startNow,
          style: AppFontStyles.styleBold20(context)
              .copyWith(
                color: Colors.black,
                //   fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
