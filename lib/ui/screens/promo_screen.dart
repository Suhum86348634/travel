import 'package:flutter/material.dart';
import 'package:travel/widgets/bottom_nav_bar.dart';
import 'package:travel/widgets/custom_button.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: screenHeight * 0.4,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Winter Vacation Trips",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "Enjoy your winter vacations with warmth\n"
                    "and amazing sightseeing on the mountains.\n"
                    "Enjoy the best experience with us!",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onBackground.withValues(alpha: 0.6),
                    ),
                  ),

                  const SizedBox(height: 24),

                  CustomButton(
                    text: "Let's Go!",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const BottomNav()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
