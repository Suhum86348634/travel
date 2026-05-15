import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  String _language = 'English';

  void _toggleDarkMode(bool value) {
    setState(() => _darkMode = value);
  }

  void _changeLanguage(String? lang) {
    if (lang == null) return;
    setState(() => _language = lang);
  }

  void _showAbout() {
    showAboutDialog(
      context: context,
      applicationName: 'Travel App',
      applicationVersion: '1.0.0',
      applicationLegalese: '© Your Company',
    );
  }

  void _logout() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logged out')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Dark Mode'),
              trailing: Switch(value: _darkMode, onChanged: _toggleDarkMode),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              subtitle: Text(_language),
              onTap: () async {
                final selected = await showModalBottomSheet<String>(
                  context: context,
                  builder: (_) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('English'),
                        onTap: () => Navigator.of(context).pop('English'),
                      ),
                      ListTile(
                        title: const Text('Spanish'),
                        onTap: () => Navigator.of(context).pop('Spanish'),
                      ),
                      ListTile(
                        title: const Text('French'),
                        onTap: () => Navigator.of(context).pop('French'),
                      ),
                    ],
                  ),
                );
                _changeLanguage(selected);
              },
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: _showAbout,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
            label: const Text('Log out'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSettingsPage() => const SettingsScreen();
