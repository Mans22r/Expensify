// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Insight_page.dart';
import 'bottom_navbar.dart';
import 'expense_page.dart';
import 'profile_page.dart';
import 'wallet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Wallet Page'),
    Text('Insight Page'),
    Text('Profile Page'),
  ];

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(20, 19, 38, 1),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Wallet'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insights),
              title: const Text('Insight'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
          ],
        ),
      ),
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
                  radius: 1.4,
                  colors: [
                    Color.fromRGBO(232, 64, 64, 0.2),
                    Color.fromRGBO(20, 19, 38, 0.0),
                  ],
                  stops: [0.0, 1.0],
                  center: Alignment.topLeft,
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Welcome',
                style: GoogleFonts.syne(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const ImageIcon(
                      AssetImage('assets/icons/side_nav.png'),
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Available Balance',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(227, 181, 60, 1),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          '₹1,05,284',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 54),
                  // Main card with progress circles at the top
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(35, 32, 63, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Progress circles at the top
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(20, 19, 38, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                progressCircle(
                                  percentage: 13,
                                  color: const Color.fromRGBO(150, 77, 247, 1),
                                ),
                                progressCircle(
                                  percentage: 61,
                                  color: const Color.fromRGBO(44, 214, 215, 1),
                                ),
                                progressCircle(
                                  percentage: 26,
                                  color: const Color.fromRGBO(255, 135, 54, 1),
                                ),
                              ],
                            ),
                          ),
                          // Transactions header
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'My transactions',
                              style: GoogleFonts.dmSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // Transactions list
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              children: [
                                transactionCard(
                                  iconPath: 'assets/logos/shell_logo.png',
                                  title: 'Shell',
                                  subtitle: 'Sep 02, 2022',
                                  amount: '-₹45',
                                  borderColor: const Color(0xFFFFCC00),
                                  edgeColor: const Color.fromRGBO(255, 204, 0, 0.7),
                                ),
                                transactionCard(
                                  iconPath: 'assets/logos/amazon_logo.png',
                                  title: 'SM Supermart',
                                  subtitle: 'Sep 01, 2022',
                                  amount: '-₹235',
                                  borderColor: const Color(0xFF00FFCC),
                                  edgeColor: const Color.fromRGBO(0, 255, 204, 0.7),
                                ),
                                transactionCard(
                                  iconPath: 'assets/logos/shell_logo.png',
                                  title: 'PinelabsPOS',
                                  subtitle: 'Aug 31, 2022',
                                  amount: '-₹164',
                                  borderColor: const Color(0xFFFF33FF),
                                  edgeColor: const Color.fromRGBO(255, 51, 255, 0.7),
                                ),
                                transactionCard(
                                  iconPath: 'assets/logos/amazon_logo.png',
                                  title: 'Amazon',
                                  subtitle: 'Aug 31, 2022',
                                  amount: '-₹984',
                                  borderColor: const Color(0xFFFF6600),
                                  edgeColor: const Color.fromRGBO(255, 102, 0, 0.7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavBar(
            currentIndex: _selectedIndex,
            
            onTap: _onItemTapped,
      ),
          ),
          Positioned(
            right: 6,
            bottom: 110,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(227, 130, 60, 1),
                    Color.fromRGBO(227, 60, 60, 1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: FloatingActionButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpensePage()),
                  );
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget transactionCard({
    required String iconPath,
    required String title,
    required String subtitle,
    required String amount,
    required Color borderColor,
    required Color edgeColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(20, 19, 38, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor.withOpacity(0.4)),
      ),
      child: Stack(
        children: [
          // Right edge color bar with increased width
          // Positioned(
          //   right: 0,
          //   top: 0,
          //   bottom: 0,
          //   child: Container(
          //     width: 12, // Increased the width of the colored edge
          //     decoration: BoxDecoration(
          //       color: edgeColor,
          //       borderRadius: const BorderRadius.only(
          //         topRight: Radius.circular(20),
          //         bottomRight: Radius.circular(20),
          //       ),
          //     ),
          //   ),
          // ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(iconPath, width: 40, height: 40),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  amount,
                  style: GoogleFonts.dmSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget progressCircle({required int percentage, required Color color}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                value: percentage / 100.0,
                backgroundColor: const Color.fromRGBO(20, 19, 38, 1),
                valueColor: AlwaysStoppedAnimation<Color>(color),
                strokeWidth: 8,
              ),
            ),
            Text(
              '$percentage%',
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
