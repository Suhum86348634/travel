import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/detail_provider.dart';
import '../../widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DetailProvider>();
    final trip = provider.selectedTrip;

    if (trip == null) {
      return const Scaffold(body: Center(child: Text("No trip selected")));
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.network(trip.imageUrl, fit: BoxFit.cover),
              ),

              Positioned(
                top: 50,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trip.title,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(trip.location),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orange),
                              const SizedBox(width: 4),
                              Text("${trip.rating}"),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Row(
                            children: [
                              IconButton(
                                onPressed: provider.decreaseDays,
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                "${provider.days}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                onPressed: provider.increaseDays,
                                icon: const Icon(Icons.add),
                              ),
                              const SizedBox(width: 12),
                              const Icon(Icons.access_time),
                              const SizedBox(width: 4),
                              Text("${provider.days} Days"),
                            ],
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "Dignissim eget amet viverra eget fames rhoncus...",
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "\$400 / Package",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        flex: 3,
                        child: CustomButton(text: "Book Now", onPressed: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
