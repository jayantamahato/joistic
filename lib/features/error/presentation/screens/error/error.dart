import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../ui_helper/sizes.dart';
import '../../../../../ui_helper/white_space.dart';
import '../../../../on_boarding/presentation/screens/on_boarding.dart';

class ErrorScreen extends StatelessWidget {
  static String route = '/error';

  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: percentHeight(percent: 100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: SvgPicture.asset(
                  'assets/icons/error.svg',
                  height: 50,
                  width: 50,
                  color: AppColors.error,
                ),
              ),
              whiteSpace(height: 20),
              const Text('Ops! Something went wrong')
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
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
            Get.offAllNamed(OnBoarding.route);
          },
          child: const Text('Retry'),
        ),
      ),
    );
  }
}
