import 'package:flutter/material.dart';

bool isDark({required BuildContext context}) {
  return Theme.of(context).brightness == Brightness.dark;
}
