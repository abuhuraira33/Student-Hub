
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/list_screen.dart';
import '../screens/about_screen.dart';

// Navigation Drawer Menu widget
class AppDrawer extends StatelessWidget {
  final Function(int)? onSelectTab;

  const AppDrawer({
    super.key,
    this.onSelectTab,
  });

  static const Color darkBlue = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: darkBlue,
            ),
            accountName: Text(
              'Abu Huraira',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: Text('abu.huraira@student.edu'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'A',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
            ),
          ),

          // Navigation Options
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // 1. Home Screen
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: darkBlue,
                  ),
                  title: const Text('Home Screen'),
                  subtitle: const Text('Main Student Hub Dashboard'),
                  onTap: () {
                    Navigator.pop(context);

                    if (onSelectTab != null) {
                      onSelectTab!(0);
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                ),

                const Divider(),

                // 2. List Screen
                ListTile(
                  leading: const Icon(
                    Icons.location_city,
                    color: darkBlue,
                  ),
                  title: const Text('List Screen (ListView)'),
                  subtitle: const Text('Display 10+ City Items'),
                  onTap: () {
                    Navigator.pop(context);

                    if (onSelectTab != null) {
                      onSelectTab!(1);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListScreen(),
                        ),
                      );
                    }
                  },
                ),

                const Divider(),

                // 3. About Screen
                ListTile(
                  leading: const Icon(
                    Icons.grid_view,
                    color: darkBlue,
                  ),
                  title: const Text('About Screen (GridView)'),
                  subtitle: const Text(
                    'Display 6 Campus Cards in 2 Columns',
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  },
                ),

                const Divider(),
              ],
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              'Student Hub',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
