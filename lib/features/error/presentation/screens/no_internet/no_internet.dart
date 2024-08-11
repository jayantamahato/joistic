import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../ui_helper/sizes.dart';
import '../../../../../ui_helper/white_space.dart';
import '../../../../on_boarding/presentation/screens/on_boarding.dart';

class NoInternet extends StatelessWidget {
  static String route = '/no-internet';
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: percentHeight(percent: 100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: SvgPicture.asset(
                  'assets/icons/disConnect.svg',
                  height: 120,
                  width: 120,
                  color: AppColors.primaryColor,
                ),
              ),
              whiteSpace(height: 20),
              const Text('You may not connected with internet')
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
            child: const Text('Retry')),
      ),
    );
  }
}
