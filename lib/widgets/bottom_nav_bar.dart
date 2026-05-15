import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:travel/ui/screens/discover_screen.dart';
import 'package:travel/ui/screens/profile_screen.dart';
import 'package:travel/ui/screens/settings_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const DiscoverScreen(),
      item: ItemConfig(icon: const Icon(Icons.explore), title: "Discover"),
    ),
    PersistentTabConfig(
      screen: const SettingsScreen(),
      item: ItemConfig(icon: const Icon(Icons.settings), title: "Settings"),
    ),
    PersistentTabConfig(
      screen: const ProfileScreen(),
      item: ItemConfig(icon: const Icon(Icons.person), title: "Profile"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
