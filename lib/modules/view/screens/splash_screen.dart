import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loda_attendance/core/routing/navigation_manager.dart';
import 'package:loda_attendance/core/utils/styles_manager.dart';
import 'package:loda_attendance/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double scale = 0;

  increaseScale() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        scale = 1.5;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    increaseScale();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          navigateBasedOnToken();
        }
      });
    });
  }

  void navigateBasedOnToken() {
    context.pushWithTransition(LoginScreen());
    // if (ConstanceManger.token == null) {
    //   context.pushAndRemove(const HomeScreen());
    // } else {
    //   context.pushAndRemove(const HomeScreen());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: AnimatedScale(
                duration: const Duration(seconds: 1),
                scale: scale,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Text(
              "Powered By LODA",
              style: TextStyleManager.getCaptionStyle().copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
