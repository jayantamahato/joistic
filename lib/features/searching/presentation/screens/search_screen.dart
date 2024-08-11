import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/config/strings/string.dart';
import 'package:joistic/features/job_portal/presentation/controller/job_portal_controller.dart';
import 'package:joistic/ui_helper/theme_checker.dart';

import '../../../../config/colors/colors.dart';
import '../../../../ui_helper/sizes.dart';
import '../../../auth/presentation/controller/auth_controller.dart';
import '../../../widgets/company_card.dart';

class SearchScreen extends StatelessWidget {
  final JobPortalController _jobPortalController =
      Get.put(JobPortalController());
  final _authController = Get.find<AuthController>();
  static String route = '/search';
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 45,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: isDark(context: context)
                  ? AppColors.lightScaffold.withOpacity(0.2)
                  : AppColors.blackColor.withOpacity(0.1),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: AppString.companyName,
            ),
            onChanged: (value) {
              _jobPortalController.searchCompany(key: value);
            },
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: percentHeight(percent: 90),
          child: Obx(
            () => _jobPortalController.isLoading.isTrue
                ? Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _jobPortalController.searchList.length,
                    itemBuilder: (context, index) => Obx(
                      () => CompanyCard(
                        desc:
                            _jobPortalController.searchList[index].title ?? '',
                        image: _jobPortalController
                                .searchList[index].thumbnailUrl ??
                            '',
                        name:
                            _jobPortalController.searchList[index].title ?? '',
                        isApplied:
                            _jobPortalController.appliedList.contains(index),
                        applyFun: () {
                          _jobPortalController.apply(
                              index: index,
                              uid: _authController.user.value.uid ?? 'No-id');
                        },
                        index: index,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
