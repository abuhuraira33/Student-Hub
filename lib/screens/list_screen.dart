import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

// List Screen - Displays a scrollable ListView of cities
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const Color darkBlue = Color(0xFF0D47A1);

  // List of at least 10 city names with country details
  final List<Map<String, String>> _cities = const [
    {'city': 'Tokyo', 'country': 'Japan'},
    {'city': 'Paris', 'country': 'France'},
    {'city': 'New York', 'country': 'United States'},
    {'city': 'London', 'country': 'United Kingdom'},
    {'city': 'Sydney', 'country': 'Australia'},
    {'city': 'Cairo', 'country': 'Egypt'},
    {'city': 'Toronto', 'country': 'Canada'},
    {'city': 'Rome', 'country': 'Italy'},
    {'city': 'Dubai', 'country': 'United Arab Emirates'},
    {'city': 'Singapore', 'country': 'Singapore'},
    {'city': 'Berlin', 'country': 'Germany'},
    {'city': 'Istanbul', 'country': 'Turkey'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar with Dark Blue theme
      appBar: AppBar(
        title: const Text('City List Screen'),
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
      ),
      // Drawer Navigation
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header info banner
          Container(
            width: double.infinity,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Showing ${_cities.length} Major Cities (Scrollable ListView)',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),
          ),
          const Divider(height: 1),
          // Scrollable ListView displaying city items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: _cities.length,
              itemBuilder: (context, index) {
                final item = _cities[index];
                return Card(
                  elevation: 0,
                  color: Colors.grey.shade100,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.location_city,
                        color: darkBlue,
                        size: 22,
                      ),
                    ),
                    title: Text(
                      item['city']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      item['country']!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      // Display simple SnackBar on item tap
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected City: ${item['city']}, ${item['country']}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
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
