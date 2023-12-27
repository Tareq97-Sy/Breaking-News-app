
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tareq_khashaneh/view/pages/main_app_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:CircleAvatar(
        backgroundImage: AssetImage("assets/images/splash.jpg"),
        radius: 100,
        
      ),
      splashIconSize: 200,
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      nextScreen: MainAppPage(),
     );
  }
}