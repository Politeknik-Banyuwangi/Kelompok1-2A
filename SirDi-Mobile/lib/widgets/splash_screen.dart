import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:pbl_kasir/widgets/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/homepage.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  bool login = true;
  autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final String? name = prefs.getString('name');
    final String? email = prefs.getString('email');
    final bool? isAdmin = prefs.getBool('isAdmin');
    Auth.token = token.toString();
    print(Auth.token);
    setState(() {
      Auth.isLogin = token == null ? false : true;
      login = Auth.isLogin;
      Auth.name = name.toString();
      Auth.email = email.toString();
      isAdmin == null ? Auth.isAdmin = false : Auth.isAdmin = true;
      // Auth.isAdmin = isAdmin as bool;
    });
    print(Auth.isLogin);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          'assets/logo/sirdi.png',
        ),
        splashIconSize: 300,
        nextScreen: login == true ? const HomePage() : const LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: Colors.white);
  }
}
