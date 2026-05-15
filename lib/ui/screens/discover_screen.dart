import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/widgets/card_item.dart';
import 'package:travel/widgets/filter_menu.dart';
import '../../providers/discover_provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DiscoverProvider>();

    return Scaffold(
      // 👇 Drawer (выезжающее меню)
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

        // 👇 слева иконка меню (автоматически открывает Drawer)
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        title: const Text("Discover"),

        // 👇 справа аватарка
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
          /// Фильтры
          FilterMenu(
            filters: const ["Popular", "Asia", "Europe", "Africa"],
            selectedFilter: provider.selectedFilter,
            onFilterSelected: provider.setFilter,
          ),

          const SizedBox(height: 16),

          /// Горизонтальный список
          SizedBox(
            height: 180,
            child: provider.horizontalTrips.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.horizontalTrips.length,
                    itemBuilder: (context, index) {
                      final trip = provider.horizontalTrips[index];
                      return Container(
                        width: 160,
                        margin: const EdgeInsets.only(right: 12),
                        child: CardItem(
                          title: trip.title,
                          rating: trip.rating,
                          imageUrl: trip.imageUrl,
                        ),
                      );
                    },
                  ),
          ),

          const SizedBox(height: 16),

          /// 🔥 GRID вместо списка
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: provider.verticalTrips.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 👈 2 колонки
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8, // 👈 пропорции карточки
              ),
              itemBuilder: (context, index) {
                final trip = provider.verticalTrips[index];
                return CardItem(
                  title: trip.title,
                  rating: trip.rating,
                  imageUrl: trip.imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}