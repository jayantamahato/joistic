import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/ui_helper/theme_checker.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/strings/string.dart';
import '../../../../core/logger/logger.dart';
import '../../../../ui_helper/font_style.dart';
import '../../../../ui_helper/sizes.dart';
import '../../../../ui_helper/white_space.dart';
import '../../../auth/presentation/controller/auth_controller.dart';
import '../../../searching/presentation/screens/search_screen.dart';
import '../controller/job_portal_controller.dart';
import '../widgets/app_bar.dart';
import '../../../widgets/company_card.dart';
import '../widgets/drawer.dart';

class CompanyList extends StatefulWidget {
  static const route = '/c-list';
  const CompanyList({super.key});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  final _authController = Get.find<AuthController>();

  final JobPortalController _jobPortalController =
      Get.put(JobPortalController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _jobPortalController.getCompanies();
      AppLog.warn(message: _authController.user.value.uid);

      await _jobPortalController.getApplied(
          uid: _authController.user.value.uid ?? 'No-id');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: cListDrawer(authController: _authController),
      appBar: cListAppBar(
          onClick: () {
            Get.toNamed(SearchScreen.route);
          },
          context: context),
      body: SizedBox(
        height: percentHeight(percent: 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.findYourDream,
                style: AppFont.normal(fontWeight: FontWeight.bold, size: 30),
              ),
              Text(
                AppString.jobToday,
                style: AppFont.normal(fontWeight: FontWeight.bold, size: 30),
              ),
              whiteSpace(height: 20),
              Container(
                height: percentHeight(percent: 71),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
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
                          itemCount: _jobPortalController.companyList.length,
                          itemBuilder: (context, index) => Obx(
                            () => CompanyCard(
                              desc: _jobPortalController
                                      .companyList[index].title ??
                                  '',
                              image: _jobPortalController
                                      .companyList[index].thumbnailUrl ??
                                  '',
                              name: _jobPortalController
                                      .companyList[index].title ??
                                  '',
                              isApplied: _jobPortalController.appliedList
                                  .contains(index),
                              applyFun: () async {
                                await _jobPortalController.apply(
                                    index: index,
                                    uid: _authController.user.value.uid ??
                                        'No-id');
                                Get.snackbar('Success', 'Job Applied',
                                    backgroundColor: isDark(context: context)
                                        ? AppColors.darkScaffold
                                        : AppColors.lightScaffold
                                            .withOpacity(0.1),
                                    colorText: AppColors.success,
                                    barBlur: 0);
                              },
                              index: index,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
