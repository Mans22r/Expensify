// bottom_nav.dart

import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: const Color.fromRGBO(20, 19, 38, 1),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ImageIcon(AssetImage('assets/icons/home.png')),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ImageIcon(AssetImage('assets/icons/wallet.png')),
          ),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ImageIcon(AssetImage('assets/icons/insight.png')),
          ),
          label: 'Insight',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ImageIcon(AssetImage('assets/icons/profile.png')),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: const Color.fromRGBO(227, 181, 60, 1),
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      onTap: onTap,
    );
  }
}
