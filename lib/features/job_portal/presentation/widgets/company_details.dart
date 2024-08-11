import 'package:flutter/material.dart';
import 'package:joistic/config/strings/string.dart';

import '../../../../config/colors/colors.dart';
import '../../../../ui_helper/font_style.dart';
import '../../../../ui_helper/sizes.dart';
import '../../../../ui_helper/theme_checker.dart';
import '../../../../ui_helper/white_space.dart';

class CompanyDetails extends StatelessWidget {
  final BuildContext context;
  final String cName;
  final int index;
  final String cDetails;
  final String imageUrl;
  final bool isApplied;
  final Function applyFun;
  const CompanyDetails(
      {super.key,
      required this.context,
      required this.cName,
      required this.cDetails,
      required this.index,
      required this.isApplied,
      required this.applyFun,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: percentWidth(percent: 100),
      height: percentHeight(percent: 60),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                width: percentWidth(percent: 100),
                decoration: BoxDecoration(
                  color: isDark(context: context)
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    whiteSpace(height: 30),
                    Text(
                      '${cName.split(' ')[0]} ${cName.split(' ')[1]}',
                      style:
                          AppFont.normal(size: 16, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      AppString.unitedState,
                      style:
                          AppFont.normal(size: 12, fontWeight: FontWeight.bold)
                              .copyWith(
                        color: isDark(context: context)
                            ? AppColors.greyColor.withOpacity(0.5)
                            : AppColors.darkScaffold.withOpacity(0.5),
                      ),
                    ),
                    whiteSpace(height: 5),
                    Text(
                      cDetails,
                      maxLines: 1,
                      style:
                          AppFont.normal(size: 12, fontWeight: FontWeight.bold)
                              .copyWith(
                        color: isDark(context: context)
                            ? AppColors.greyColor.withOpacity(0.5)
                            : AppColors.darkScaffold.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  color: isDark(context: context)
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(10),
                  ),
                ),
                width: percentWidth(percent: 100),
                height: percentHeight(percent: 29),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      whiteSpace(height: 20),
                      Text('Job title',
                          style: AppFont.normal(
                                  fontWeight: FontWeight.bold, size: 12)
                              .copyWith(
                                  color: isDark(context: context)
                                      ? AppColors.lightScaffold.withOpacity(0.3)
                                      : AppColors.blackColor.withOpacity(0.3))),
                      whiteSpace(height: 10),
                      Text(
                        AppString.seniorUiUxDesigner,
                        style: AppFont.normal(
                            fontWeight: FontWeight.bold, size: 14),
                      ),
                      whiteSpace(height: 25),
                      Text('Job description',
                          style: AppFont.normal(
                                  fontWeight: FontWeight.bold, size: 12)
                              .copyWith(
                                  color: isDark(context: context)
                                      ? AppColors.lightScaffold.withOpacity(0.3)
                                      : AppColors.blackColor.withOpacity(0.3))),
                      whiteSpace(height: 10),
                      Text(
                        AppString.weAreLookingFor,
                        style: AppFont.normal(
                                fontWeight: FontWeight.bold, size: 12)
                            .copyWith(wordSpacing: 3),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: percentWidth(percent: 100),
                color: isDark(context: context)
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: percentWidth(percent: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isApplied
                        ? AppColors.success.withOpacity(0.3)
                        : AppColors.primaryColor.withOpacity(0.3),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(isApplied
                          ? AppColors.success
                          : AppColors.primaryColor),
                      foregroundColor:
                          WidgetStatePropertyAll(AppColors.whiteColor),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      applyFun();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      isApplied ? 'APPLIED' : 'APPLY NOW',
                      style: AppFont.normal(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 40,
            left: 40,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: isDark(context: context)
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(50)),
              child: CircleAvatar(
                backgroundColor: isDark(context: context)
                    ? AppColors.darkScaffold
                    : AppColors.greyColor,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
