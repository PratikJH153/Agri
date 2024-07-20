// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';

void debugData(dynamic data, {required String filename}) {
  if (kDebugMode) {
    print("🔥🔥 Data in $filename 🔥🔥 ${data.toString()}");
  }
}
