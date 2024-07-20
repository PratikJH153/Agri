import 'package:agri/firebase_options.dart';
import 'package:agri/theme/theme.dart';
import 'package:agri/utils/routes.dart';
import 'package:agri/views/auth/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarBrightness: Brightness.light,
  ));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agri',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      darkTheme: themeData,
      themeMode: ThemeMode.dark,
      initialRoute: Wrapper.routeID,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
