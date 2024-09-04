import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/home.png')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/wallet.png')),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/insight.png')),
          label: 'Insight',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/profile.png')),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromRGBO(227, 181, 60, 1),
      unselectedItemColor: Colors.grey,
      backgroundColor: const Color.fromRGBO(20, 19, 38, 1),
      elevation: 0, // Remove shadow
      onTap: onItemTapped,
    );
  }
}
