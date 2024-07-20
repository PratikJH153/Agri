// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';

void debugError(
  String error,
  String filename,
) {
  if (kDebugMode) {
    print("❌❌ ERROR in $filename ❌❌ $error");
  }
}
