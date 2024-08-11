import 'package:get/get.dart';

import '../../features/error/presentation/screens/no_internet/no_internet.dart';

class DisConnected {
  DisConnected() {
    Get.offAllNamed(NoInternet.route);
  }
}
