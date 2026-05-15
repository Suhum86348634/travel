import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:travel/ui/screens/detail_screen.dart';
import 'package:travel/ui/screens/discover_screen.dart';



class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  List<PersistentTabConfig> _tabs() => [
        
        PersistentTabConfig(
          screen: const DiscoverScreen(),
          item: ItemConfig(icon: const Icon(Icons.explore), title: "Discover"),
        ),
        PersistentTabConfig(
          screen: const DetailScreen(),
          item: ItemConfig(icon: const Icon(Icons.info), title: "Detail"),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
