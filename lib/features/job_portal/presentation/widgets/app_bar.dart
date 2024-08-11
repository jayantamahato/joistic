import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';
import '../../../../ui_helper/theme_checker.dart';

AppBar cListAppBar({required Function onClick, required BuildContext context}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(isDark(context: context)
                ? AppColors.blackColor
                : AppColors.whiteColor),
          ),
          onPressed: () {
            onClick();
          },
          icon: const Icon(Icons.search),
        ),
      )
    ],
  );
}
