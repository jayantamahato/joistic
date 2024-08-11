import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/config/strings/string.dart';

import '../../../../config/colors/colors.dart';
import '../../../../ui_helper/sizes.dart';
import '../../../auth/presentation/controller/auth_controller.dart';

Drawer cListDrawer({required AuthController authController}) {
  return Drawer(
    width: percentWidth(percent: 80),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(authController.user.value.photoURL ?? ''),
            ),
            title: Obx(() => Text(authController.user.value.displayName ?? '')),
            subtitle: Text(authController.user.value.email ?? ''),
          ),
        ),
        SizedBox(
          width: percentWidth(percent: 60),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(
                  AppColors.error.withOpacity(0.1),
                ),
                surfaceTintColor: WidgetStatePropertyAll(AppColors.error),
                shape: WidgetStatePropertyAll(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                foregroundColor: WidgetStatePropertyAll(AppColors.error),
                side: WidgetStatePropertyAll(
                  BorderSide(color: AppColors.error),
                ),
              ),
              onPressed: () async {
                await authController.signOut();
                Get.offAllNamed('/');
              },
              child: Text(AppString.logOut),
            ),
          ),
        )
      ],
    ),
  );
}
