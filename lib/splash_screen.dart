import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Automatically navigate to the HomePage after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to HomePage when screen is tapped
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background color
            Container(
              color: const Color.fromRGBO(20, 19, 38, 1),
            ),
            // Blended background and gradient overlay
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.6,
                    colors: [
                      Color.fromRGBO(232, 64, 64, 0.2),
                      Color.fromRGBO(20, 19, 38, 0),
                    ],
                    stops: [0.0, 1.0],
                    center: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            // Positioned logo
            Center(
              child: Image.asset(
                'assets/logos/logo_main.png',
                width: 354,
                height: 404,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
