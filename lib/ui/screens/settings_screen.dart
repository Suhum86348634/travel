import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/theme_provier.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Travel App',
      applicationVersion: '1.0.0',
      applicationLegalese: '© Suhum8634',
    );
  }

  void _logout(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logged out')));
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Dark Mode'),

              trailing: Switch(
                value: themeProvider.isDark,
                onChanged: (value) {
                  context.read<ThemeProvider>().setDark(value);
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => _showAbout(context),
            ),
          ),

          const SizedBox(height: 16),

          ElevatedButton.icon(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
            label: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
