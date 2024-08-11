import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/core/logger/logger.dart';

import '../../../../config/colors/colors.dart';
import '../../../../ui_helper/sizes.dart';
import '../../../auth/presentation/controller/auth_controller.dart';
import '../../../auth/presentation/screens/sign_in.dart';
import '../../../job_portal/presentation/screens/company_list.dart';
import '../../data/model/credential_model.dart';
import '../controller/on_boarding_controller.dart';

class OnBoarding extends StatefulWidget {
  static const String route = '/';
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final OnBoardingController _onBoardingController = Get.put(
    OnBoardingController(),
  );
  final AuthController _authController = Get.put(
    AuthController(),
  );
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      try {
        CredentialModel? res =
            await _onBoardingController.checkAuthentication();
        if (res != null) {
          await _authController.signInWithCredentials(credentials: res);
          Get.toNamed(CompanyList.route);
          return;
        }
        Get.toNamed(SignIn.route);
      } catch (e) {
        AppLog.error(message: e);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: adaptiveHeight(height: 50),
          width: adaptiveWidth(width: 50),
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Checking Authentication...'),
          ],
        ),
      ),
    );
  }
}
