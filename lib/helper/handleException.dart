import 'package:agri/services/debug_error.dart';

Future<dynamic> handleException(exception, stackTrace, filename) async {
  debugError(exception.toString(), filename);
}
