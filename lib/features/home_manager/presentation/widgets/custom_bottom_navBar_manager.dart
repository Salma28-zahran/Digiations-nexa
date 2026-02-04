import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        padding: const EdgeInsets.only(bottom: 6),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? const Color(0xff2c2b2b)
                : Colors.white,
            selectedItemColor: const Color(0xFF4A90E2),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                icon: _AnimatedIcon(
                  icon: Icons.tune,
                  index: 0,
                  currentIndex: currentIndex,
                ),
                label: "Control",
              ),
              BottomNavigationBarItem(
                icon: _AnimatedIcon(
                  icon: Icons.groups,
                  index: 1,
                  currentIndex: currentIndex,
                ),
                label: "Employees",
              ),
              BottomNavigationBarItem(
                icon: _AnimatedIcon(
                  icon: Icons.person,
                  index: 2,
                  currentIndex: currentIndex,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _AnimatedIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;

  const _AnimatedIcon({
    required this.icon,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = currentIndex == index;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 1,
        end: selected ? 1.35 : 1,
      ),
      duration: const Duration(milliseconds: 350),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, selected ? -8 : 0),
          child: Transform.scale(
            scale: value,
            child: Icon(icon),
          ),
        );
      },
    );
  }
}