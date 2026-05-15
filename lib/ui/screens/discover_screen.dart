import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/detail_provider.dart';
import 'package:travel/ui/screens/detail_screen.dart';
import 'package:travel/widgets/card_item.dart';
import 'package:travel/widgets/filter_menu.dart';
import '../../providers/discover_provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DiscoverProvider>();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {},
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        title: const Text("Discover"),

        actions: [
          GestureDetector(
            onTap: () {
              // TODO: переход в профиль
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterMenu(
            filters: const ["Popular", "Asia", "Europe", "Africa"],
            selectedFilter: provider.selectedFilter,
            onFilterSelected: provider.setFilter,
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 180,
            child: provider.horizontalTrips.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.horizontalTrips.length,
                    itemBuilder: (context, index) {
                      final trip = provider.horizontalTrips[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<DetailProvider>().setTrip(trip);

                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (_) => const DetailScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 160,
                          margin: const EdgeInsets.only(right: 12),
                          child: CardItem(
                            title: trip.title,
                            rating: trip.rating,
                            imageUrl: trip.imageUrl,
                          ),
                        ),
                      );
                    },
                  ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: provider.verticalTrips.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final trip = provider.verticalTrips[index];
                return GestureDetector(
                  onTap: () {
                    context.read<DetailProvider>().setTrip(trip);

                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (_) => const DetailScreen()),
                    );
                  },
                  child: CardItem(
                    title: trip.title,
                    rating: trip.rating,
                    imageUrl: trip.imageUrl,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
