import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/widgets/custom_button.dart';
import '../../providers/detail_provider.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailProvider = Provider.of<DetailProvider>(context);
    final trip = detailProvider.selectedTrip;

    if (trip == null) {
      return const Scaffold(body: Center(child: Text("No trip selected")));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(trip.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text(trip.location),
            const SizedBox(height: 8),
            Text("⭐ ${trip.rating}"),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("${detailProvider.days} Days"),
                const SizedBox(width: 12),
                IconButton(onPressed: detailProvider.decreaseDays, icon: const Icon(Icons.remove)),
                IconButton(onPressed: detailProvider.increaseDays, icon: const Icon(Icons.add)),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Dignissim eget amet viverra eget fames rhoncus...",
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("\$400 / Package", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                CustomButton(text: "Book Now", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
