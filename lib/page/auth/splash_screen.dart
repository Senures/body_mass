import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    goHome();
    super.initState();
  }

  goHome() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Neumorphic(
              padding: const EdgeInsets.all(15.0),
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 8,
                  lightSource: LightSource.topLeft,
                  color: const Color(0xffF6F9FE)),
              child: Image.asset(
                "assets/images/splash.png",
                width: 150.0,
              ))),
    );
  }
}
