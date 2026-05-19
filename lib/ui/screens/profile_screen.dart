import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pTheme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Profile', style: pTheme.textTheme.displayLarge), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundImage: const NetworkImage(
                        "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text('Vasiliy Pupkin', style: pTheme.textTheme.bodyLarge),
                    const SizedBox(height: 4),
                    Text(
                      'pupandlupa@example.com',
                      style: pTheme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTileTheme(
                    iconColor: pTheme.colorScheme.onPrimary,
                    textColor: pTheme.colorScheme.onSurface,
                    style: ListTileStyle.list,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person_outline),
                          title: const Text('Edit Profile'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on_outlined),
                          title: const Text('Saved Places'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.credit_card),
                          title: const Text('Payment Methods'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings_outlined),
                          title: const Text('Settings'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.help_outline),
                          title: const Text('Support'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: pTheme.colorScheme.error,
                          ),
                          title: Text(
                            'Log out',
                            style: TextStyle(color: pTheme.colorScheme.error),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
