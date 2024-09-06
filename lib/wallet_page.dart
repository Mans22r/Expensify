// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lascade_app/home_page.dart';
import 'Insight_page.dart';
import 'bottom_navbar.dart';
import 'profile_page.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _selectedIndex = 1;

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
          'Wallet',
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Center(
                    child: Text(
                      'Cards',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 18,
                        color: Color.fromRGBO(227, 181, 60, 1),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 260, // Adjust height for scroll
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 60,
                            child: cardWidget(index: 3), // Third card further below
                          ),
                          Positioned(
                            bottom: 30,
                            child: cardWidget(index: 2), // Second card slightly below
                          ),
                          Positioned(
                            bottom: 0,
                            child: cardWidget(index: 1), // First card fully visible
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Adjusted spacing after the card stack
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: Color.fromRGBO(227, 181, 60, 1),
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25), // Adjusted space before the amount section
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          '₹1,05,284',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Available Balance',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    color: const Color.fromRGBO(36, 35, 55, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Color.fromRGBO(227, 181, 60, 1),
                                size: 30,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Add card',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color.fromRGBO(227, 181, 60, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Add your credit / debit card',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Card Number',
                              labelStyle: const TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.white, width: 0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Expiry Date (MM/YY)',
                                    labelStyle: const TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.white, width: 0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'CVV',
                                    labelStyle: const TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.white, width: 0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24), // Space after the form
                ],
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

  Widget cardWidget({required int index}) {
    if (index == 1) {
      return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 320,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(227, 181, 60, 1),
                Color.fromRGBO(62, 25, 140, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/chip.png',
                      width: 60,
                    ),
                    Image.asset(
                      'assets/images/wifi.png',
                      width: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  '1234 5678 9012 3456',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 70)),
                    Text(
                      'VALID\nTHRU',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 5,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '09/24',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                  'CHANDRAMA SAHA',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                    Image.asset(
                      'assets/images/mastercard.png',
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else if (index == 2) {
      return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 320,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                 Color.fromRGBO(152, 22, 22, 1),
                 Color.fromRGBO(0, 0, 0, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      );
    } else if (index == 3) {
      return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 320,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(4, 100, 254, 1),
                Color.fromRGBO(236, 203, 203, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      );
    }
    return Container(); // Fallback empty container
  }
}
