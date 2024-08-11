import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../logger/logger.dart';

Future<bool> hasConnection() async {
  bool res = await InternetConnectionChecker().hasConnection;
  AppLog.debug(message: 'Internet Status: $res');
  return res;
}
