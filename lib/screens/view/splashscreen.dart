import 'package:adv_flutter_exam_1/screens/view/homescreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/img/logo1.png',
          color: Colors.green,
        ),
      ),
    );
  }
}
