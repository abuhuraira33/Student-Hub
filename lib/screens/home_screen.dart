import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'list_screen.dart';
import 'about_screen.dart';

// Home Screen - Main Dashboard for Student Hub
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color darkBlue = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar with Dark Blue theme
      appBar: AppBar(
        title: const Text('Student Hub - Home'),
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
      ),
      // Drawer Menu
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              elevation: 0,
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: darkBlue,
                      child: Icon(
                        Icons.person,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, Abu Huraira! 👋',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: darkBlue,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Computer Science • Year 4',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Navigation Section Header
            const Text(
              'Navigation Options',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Option 1: Open List Screen (ListView)
            Card(
              elevation: 0,
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Icon(Icons.location_city, color: darkBlue),
                ),
                title: const Text(
                  'List Screen (ListView)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('View 10+ major world cities in a scrollable list'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: darkBlue),
                onTap: () {
                  // Navigate to ListScreen using Navigator.push
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // Option 2: Open About Screen (GridView)
            Card(
              elevation: 0,
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Icon(Icons.grid_view, color: darkBlue),
                ),
                title: const Text(
                  'About Screen (GridView)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('View exactly 6 features in a 2-column grid'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: darkBlue),
                onTap: () {
                  // Navigate to AboutScreen using Navigator.push
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Informational Card
            Card(
              elevation: 0,
              color: Colors.blue.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.blue.shade200),
              ),
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: darkBlue),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'You can also swipe from the left or tap the top-left menu icon to open the Drawer for navigation.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
