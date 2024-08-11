import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/strings/string.dart';
import '../../../../config/values/icons.dart';
import '../../../../ui_helper/white_space.dart';

ElevatedButton signInButton(
    {required Function onClick, required bool isLoading}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
      foregroundColor: WidgetStatePropertyAll(AppColors.whiteColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    onPressed: () {
      onClick();
    },
    child: isLoading
        ? SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
                width: 15,
                child: SvgPicture.asset(AppIcon.googleIcon),
              ),
              whiteSpace(width: 20),
              Text(AppString.google)
            ],
          ),
  );
}
