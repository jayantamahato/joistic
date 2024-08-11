import 'package:get/get.dart';

double percentWidth({required int percent}) {
  double width = Get.width;
  return (width * percent) / 100;
}

double percentHeight({required int percent}) {
  double height = Get.height;
  return (height * percent) / 100;
}

double adaptiveWidth({required int width}) {
  return width * 1.0;
}

double adaptiveHeight({required int height}) {
  return height * 1.0;
}
