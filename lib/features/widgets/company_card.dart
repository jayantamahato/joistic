import 'package:flutter/material.dart';
import 'package:joistic/ui_helper/theme_checker.dart';

import '../../config/colors/colors.dart';
import '../../ui_helper/font_style.dart';
import '../job_portal/presentation/widgets/company_details.dart';

class CompanyCard extends StatelessWidget {
  final String name;
  final String image;
  final String desc;
  final bool isApplied;
  final int index;
  final Function applyFun;
  const CompanyCard(
      {super.key,
      required this.name,
      required this.image,
      required this.desc,
      required this.isApplied,
      required this.index,
      required this.applyFun});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark(context: context)
            ? AppColors.blackColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => CompanyDetails(
              cDetails: desc,
              cName: name,
              context: context,
              applyFun: applyFun,
              index: index,
              isApplied: isApplied,
              imageUrl: image,
            ),
          );
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: isDark(context: context)
                  ? AppColors.darkScaffold
                  : AppColors.greyColor,
              shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
        title: Text(
          '${name.split(' ')[0]} ${name.split(' ')[1]}',
          style: AppFont.normal(
            fontWeight: FontWeight.bold,
            size: 15,
          ),
        ),
        subtitle: Text(
          desc,
          style: AppFont.normal(fontWeight: FontWeight.w300, size: 15).copyWith(
              color: isDark(context: context)
                  ? AppColors.greyColor.withOpacity(0.5)
                  : AppColors.blackColor.withOpacity(0.4)),
          maxLines: 1,
        ),
        trailing: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  width: 8,
                  color:
                      isApplied ? AppColors.success : AppColors.primaryColor)),
        ),
      ),
    );
  }
}
