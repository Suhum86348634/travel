import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/detail_provider.dart';
import 'package:travel/ui/screens/detail_screen.dart';
import 'package:travel/ui/screens/profile_screen.dart';
import 'package:travel/ui/screens/settings_screen.dart';
import 'package:travel/widgets/card_item.dart';
import 'package:travel/widgets/filter_menu.dart';
import '../../providers/discover_provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DiscoverProvider>();
    final theme = Theme.of(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: theme.colorScheme.primary),
              child: Text(
                "Menu",
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.explore),
              title: const Text("Discover"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: const Text("Discover"),

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
              child: const CircleAvatar(
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.isLoading
                  ? 5
                  : provider.horizontalTrips.length,
              itemBuilder: (context, index) {
                if (provider.isLoading) {
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.only(right: 12),
                    child: const CardItem(
                      title: '',
                      rating: 0,
                      imageUrl: '',
                      isLoading: true,
                    ),
                  );
                }

                final trip = provider.horizontalTrips[index];

                return GestureDetector(
                  onTap: () {
                    context.read<DetailProvider>().setTrip(trip);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DetailScreen()),
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
              itemCount: provider.isLoading ? 6 : provider.verticalTrips.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                if (provider.isLoading) {
                  return const CardItem(
                    title: '',
                    rating: 0,
                    imageUrl: '',
                    isLoading: true,
                  );
                }

                final trip = provider.verticalTrips[index];

                return GestureDetector(
                  onTap: () {
                    context.read<DetailProvider>().setTrip(trip);
                    Navigator.push(
                      context,
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
