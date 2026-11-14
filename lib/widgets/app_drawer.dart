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
          // Drawer Header with student info
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: darkBlue,
            ),
            accountName: Text(
              'Alex Morgan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: Text('alex.morgan@student.edu'),
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
          // Drawer Navigation Options
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // 1. Home Screen Option
                ListTile(
                  leading: const Icon(Icons.home, color: darkBlue),
                  title: const Text('Home Screen'),
                  subtitle: const Text('Main Student Hub Dashboard'),
                  onTap: () {
                    Navigator.pop(context); // Close Drawer
                    if (onSelectTab != null) {
                      onSelectTab!(0);
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    }
                  },
                ),
                const Divider(),

                // 2. List Screen Option (ListView)
                ListTile(
                  leading: const Icon(Icons.location_city, color: darkBlue),
                  title: const Text('List Screen (ListView)'),
                  subtitle: const Text('Display 10+ City Items'),
                  onTap: () {
                    Navigator.pop(context); // Close Drawer
                    if (onSelectTab != null) {
                      onSelectTab!(1);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ListScreen()),
                      );
                    }
                  },
                ),
                const Divider(),

                // 3. About Screen Option (GridView)
                ListTile(
                  leading: const Icon(Icons.grid_view, color: darkBlue),
                  title: const Text('About Screen (GridView)'),
                  subtitle: const Text('Display 6 Campus Cards in 2 Columns'),
                  onTap: () {
                    Navigator.pop(context); // Close Drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutScreen()),
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
              'Student Hub • Assignment #2',
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
