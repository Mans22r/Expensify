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
  int _selectedToggleIndex = 0;
  int _selectedIncomeExpenseIndex = 0;

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
                  radius: 1.0,
                  colors: [
                    Color.fromRGBO(232, 64, 64, 0.4),
                    Color.fromRGBO(20, 19, 38, 0.0),
                  ],
                  stops: [0.0, 1.0],
                  center: Alignment.topLeft,
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
          Padding(
            padding: const EdgeInsets.only(top: 120.0), // Adjusted for AppBar height
            child: Column(
              children: [
                // Slide changer button at the top (Statistics / Savings Plan)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSlideChangerButton("Statistics", 0),
                    _buildSlideChangerButton("Savings Plan", 1),
                  ],
                ),
                const SizedBox(height: 33),
                // Toggle buttons (Daily / Monthly / Yearly)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildToggleButton("Daily", 0),
                    _buildToggleButton("Monthly", 1),
                    _buildToggleButton("Yearly", 2),
                  ],
                ),
                const SizedBox(height: 20),
                // Total Expense text and amount
                const Text(
                  "Total Expense",
                  style: TextStyle(
                    color: Color.fromRGBO(227, 181, 60, 1),
                    fontSize: 16,
                    fontFamily: 'Syne',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "₹18,687",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Syne',
                  ),
                ),
                const SizedBox(height: 20),
                // Slide changer button (Income / Expense)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSlideChangerButton("Income", 0),
                    _buildSlideChangerButton("Expense", 1),
                  ],
                ),
                const SizedBox(height: 20),
                // Graphical chart view (Placeholder)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(38, 36, 61, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // Placeholder for the graph chart
                    child: const Center(
                      child: Text(
                        "Graph Chart View",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Days of the week text (Mon-Fri)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Mon", style: TextStyle(color: Colors.white)),
                      Text("Tue", style: TextStyle(color: Color.fromRGBO(227, 181, 60, 1))),
                      Text("Wed", style: TextStyle(color: Colors.white)),
                      Text("Thu", style: TextStyle(color: Colors.white)),
                      Text("Fri", style: TextStyle(color: Colors.white)),
                      Text("Sat", style: TextStyle(color: Colors.white)),
                      Text("Sun", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
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

Widget _buildSlideChangerButton(String text, int index) {
  return GestureDetector(
    onTap: () {
      setState(() {
        _selectedToggleIndex = index;
      });
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: _selectedToggleIndex == index ? const Color.fromRGBO(227, 181, 60, 1) : Colors.white,
            fontWeight: FontWeight.normal,
            fontFamily: 'Syne',
          ),
        ),
        const SizedBox(height: 4), // Spacing between text and underline
        Container(
          height: 2, // Underline thickness
          width: 200, // Underline width
          decoration: BoxDecoration(
            color: _selectedToggleIndex == index ? const Color.fromRGBO(227, 181, 60, 1) : Colors.transparent,
            borderRadius: BorderRadius.circular(4), // Rounded edges for the underline
          ),
        ),
      ],
    ),
  );
}

Widget _buildToggleButton(String text, int index) {
  return GestureDetector(
    onTap: () {
      setState(() {
        _selectedIncomeExpenseIndex = index;
      });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        // Apply gradient when selected, otherwise use the default color
        gradient: _selectedIncomeExpenseIndex == index
            ? const LinearGradient(
                colors: [
                  Color.fromRGBO(227, 130, 60, 1), // Start color
                  Color.fromRGBO(227, 60, 60, 1), // End color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: _selectedIncomeExpenseIndex != index
            ?  Colors.transparent
            : null, // Default background for unselected
        borderRadius: BorderRadius.circular(15),
        border: _selectedIncomeExpenseIndex == index
            ? Border.all(color: Colors.transparent) // No border for selected state
            : Border.all(color: Colors.transparent), // Optional border for unselected
      ),
      child: Text(
        text,
        style: TextStyle(
          color: _selectedIncomeExpenseIndex == index ? Colors.white : Colors.white,
          fontFamily: 'Syne',
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

}
