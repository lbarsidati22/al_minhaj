import 'package:al_minhaj/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({
  required String title,
  required BuildContext context,
  bool isNotification = false,
}) {
  return AppBar(
    actions: [
      isNotification
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            )
          : Container(),
    ],
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: Theme.of(context).textTheme.displayLarge!
          .copyWith(
            color: AppTheme.isDark(context)
                ? Colors.white
                : Colors.black,
          ),
    ),
  );
}
