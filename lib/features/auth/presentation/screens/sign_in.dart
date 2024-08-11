import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/strings/string.dart';
import '../../../../core/logger/logger.dart';
import '../../../../ui_helper/font_style.dart';
import '../../../../ui_helper/sizes.dart';
import '../../../../ui_helper/theme_checker.dart';
import '../../../../ui_helper/white_space.dart';
import '../../../job_portal/presentation/screens/company_list.dart';
import '../controller/auth_controller.dart';
import '../widgets/sign_in_button.dart';

class SignIn extends StatelessWidget {
  static const String route = '/sign-in';
  SignIn({super.key});
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.welcomeTo,
                    style: AppFont.normal(size: 25, fontWeight: FontWeight.w500)
                        .copyWith(
                      color: isDark(context: context)
                          ? AppColors.greyColor
                          : AppColors.blackColor.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    AppString.joistic,
                    style: AppFont.normal(size: 45, fontWeight: FontWeight.w500)
                        .copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  whiteSpace(height: 40),
                  SizedBox(
                    height: percentHeight(percent: 45),
                    width: percentWidth(percent: 99),
                    child: SvgPicture.asset(
                      'assets/images/auth.svg',
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    width: percentWidth(percent: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                          width: percentWidth(percent: 20),
                          child: const Divider(
                            height: 2,
                          ),
                        ),
                        Text(AppString.continueWith),
                        SizedBox(
                          height: 5,
                          width: percentWidth(percent: 20),
                          child: const Divider(
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  whiteSpace(height: 20),
                  Obx(() => SizedBox(
                        height: 45,
                        width: percentWidth(percent: 65),
                        child: signInButton(
                            onClick: signInWithGoogle,
                            isLoading: _authController.isLoading.value),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future signInWithGoogle() async {
    try {
      await _authController.signInWithGoogle();
      Get.offAllNamed(CompanyList.route);
    } catch (e) {
      AppLog.error(message: e);
    }
  }
}
