import 'package:agri/views/auth/onboard.dart';
import 'package:agri/views/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  static const routeID = '/wrapper';

  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  // final AuthManager _authManager = AuthManager();
  bool _isUserSignedIn = false;
  bool _isLoading = false;

  final String filename = 'wrapper.dart';

  @override
  void initState() {
    checkUserRegistration();
    super.initState();
  }

  void checkUserRegistration() async {
    // setState(() {
    //   _isLoading = true;
    // });
    // final isSignedIn = _authManager.isUserGoogleSignedIn();
    // UserModel? user;
    // if (isSignedIn) {
    //   UserDataProvider userProvider = context.read<UserDataProvider>();
    //   user = await userProvider.getMemoizedUserData();
    //   if (user == null) {
    //     Future.delayed(const Duration(seconds: 4), () {
    //       setState(() {
    //         _isUserSignedIn = isSignedIn;
    //         _isUserRegistered = false;
    //         _isLoading = false;
    //         userModel = user;
    //       });
    //     });
    //     return;
    //   }
    // }
    // Future.delayed(const Duration(seconds: 4), () {
    //   setState(() {
    //     _isUserSignedIn = isSignedIn;
    //     _isUserRegistered = user != null;
    //     _isLoading = false;
    //     userModel = user;
    //   });
    // });
  }

  bool isUserRegistered() {
    return _isUserSignedIn;
  }

  @override
  Widget build(BuildContext context) {
    return isUserRegistered() ? const HomePage() : const OnboardPage();
  }
}
