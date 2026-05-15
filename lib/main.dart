import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/discover_provider.dart';
import 'package:travel/ui/screens/promo_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DiscoverProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PromoScreen(),
    );
  }
}