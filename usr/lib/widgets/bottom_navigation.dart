import 'package:flutter/material.dart';

class TikTokBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const TikTokBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Colors.grey[900]!,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home,
            label: 'Accueil',
            index: 0,
            isSelected: currentIndex == 0,
          ),
          _buildNavItem(
            icon: Icons.people,
            label: 'Amis',
            index: 1,
            isSelected: currentIndex == 1,
          ),
          _buildCreateButton(),
          _buildNavItem(
            icon: Icons.inbox,
            label: 'Boîte',
            index: 3,
            isSelected: currentIndex == 3,
          ),
          _buildNavItem(
            icon: Icons.person,
            label: 'Profil',
            index: 4,
            isSelected: currentIndex == 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateButton() {
    return GestureDetector(
      onTap: () => onTap(2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background layers for TikTok-style create button
          Row(
            children: [
              Container(
                width: 32,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFF00D9FF),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 32,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF0050),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
          // Center icon
          Container(
            width: 44,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}