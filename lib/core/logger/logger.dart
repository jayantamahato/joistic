import 'package:logger/web.dart';

class AppLog {
  static final Logger _log = Logger();
  static error({required message}) {
    _log.e('$message');
  }

  static debug({required message}) {
    _log.d('$message');
  }

  static warn({required message}) {
    _log.w('$message');
  }
}
