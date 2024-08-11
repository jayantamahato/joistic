import 'package:get/get.dart';

import '../../features/error/presentation/screens/error/error.dart';
import '../logger/logger.dart';

class AppError {
  AppError({required message}) {
    AppLog.error(message: message);
    Get.offAllNamed(ErrorScreen.route);
  }
}
