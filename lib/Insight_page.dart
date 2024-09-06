// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lascade_app/home_page.dart';
import 'bottom_navbar.dart';
import 'profile_page.dart';
import 'wallet_page.dart';

class InsightPage extends StatefulWidget {
  const InsightPage({super.key});

  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WalletPage()),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InsightPage()),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Insight',
          style: TextStyle(
            fontFamily: 'Syne',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Add action for three dots here
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromRGBO(20, 19, 38, 1),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 0.6,
                  colors: [
                    Color.fromRGBO(232, 64, 64, 0.4),
                    Color.fromRGBO(20, 19, 38, 0.0),
                  ],
                  stops: [0.0, 1.0],
                  center: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.0,
                  colors: [
                    Color.fromRGBO(232, 64, 64, 0.3),
                    Color.fromRGBO(20, 19, 38, 0.0),
                  ],
                  stops: [0.0, 1.0],
                  center: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}