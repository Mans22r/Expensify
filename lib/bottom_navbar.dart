// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isTransparent;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.isTransparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: isTransparent
          ? Colors.transparent
          : const Color.fromRGBO(20, 19, 38, 1),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _buildIconWithGlow('assets/icons/home.png', 0),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIconWithGlow('assets/icons/wallet.png', 1),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: _buildIconWithGlow('assets/icons/insight.png', 2),
          label: 'Insight',
        ),
        BottomNavigationBarItem(
          icon: _buildIconWithGlow('assets/icons/profile.png', 3),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: const Color.fromRGBO(227, 181, 60, 1),
      unselectedItemColor: Colors.white,
      elevation: 0,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
    );
  }

  // Function to build an icon with optional glow
  Widget _buildIconWithGlow(String assetPath, int index) {
    bool isSelected = currentIndex == index;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: isSelected
          ? Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(227, 181, 60, 1).withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ImageIcon(AssetImage(assetPath)),
            )
          : ImageIcon(AssetImage(assetPath)),
    );
  }
}
