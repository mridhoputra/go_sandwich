import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_sandwich/pages/cart/cart_page.dart';
import 'package:go_sandwich/pages/home/home_page.dart';
import 'package:go_sandwich/pages/profile/profile_page.dart';
import 'package:go_sandwich/pages/search/search_page.dart';

class BottomNav extends StatefulWidget {
  final Widget child;

  const BottomNav({super.key, required this.child});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final tabs = [
    const ScaffoldWithNavBarTabItem(
      initialLocation: HomePage.routeName,
      icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    const ScaffoldWithNavBarTabItem(
      initialLocation: SearchPage.routeName,
      icon: Icon(Icons.search_rounded),
      label: 'Search',
    ),
    const ScaffoldWithNavBarTabItem(
      initialLocation: CartPage.routeName,
      icon: Icon(Icons.shopping_cart_rounded),
      label: 'Cart',
    ),
    const ScaffoldWithNavBarTabItem(
      initialLocation: ProfilePage.routeName,
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  int get _currentIndex => _locationToTabIndex(
      GoRouter.of(context).routerDelegate.currentConfiguration.last.matchedLocation);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.pushNamed(tabs[tabIndex].initialLocation);
    } else {
      context.goNamed(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        elevation: 10,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFC9C9C9),
        onTap: (index) => _onItemTapped(context, index),
        unselectedLabelStyle: const TextStyle(color: Color(0xFFC9C9C9)),
      ),
    );
  }
}

/// Representation of a tab item in the [ScaffoldWithBottomNavBar]
class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  final String initialLocation;

  const ScaffoldWithNavBarTabItem({
    required this.initialLocation,
    required Widget icon,
    String? label,
  }) : super(icon: icon, label: label);
}
