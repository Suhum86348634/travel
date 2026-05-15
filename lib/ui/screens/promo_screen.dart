import 'package:flutter/material.dart';
import 'package:travel/widgets/bottom_nav_bar.dart';
import 'package:travel/widgets/custom_button.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            // Верхняя картинка
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

            // Нижний блок
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 💥 фикс overflow
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Winter Vacation Trips",
                    style: TextStyle(
                      fontFamily: "Merriweather",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    "Enjoy your winter vacations with warmth\n"
                    "and amazing sightseeing on the mountains.\n"
                    "Enjoy the best experience with us!",
                    style: TextStyle(
                      fontFamily: "Source Sans Pro",
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 24),

                  CustomButton(
                    text: "Let’s Go!",
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
