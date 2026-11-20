
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  final List<Map<String, String>> cities = const [
    {'name': 'Cairo', 'country': 'Egypt'},
    {'name': 'Toronto', 'country': 'Canada'},
    {'name': 'Rome', 'country': 'Italy'},
    {'name': 'Dubai', 'country': 'United Arab Emirates'},
    {'name': 'Singapore', 'country': 'Singapore'},
    {'name': 'Berlin', 'country': 'Germany'},
    {'name': 'Istanbul', 'country': 'Turkey'},
    {'name': 'Islamabad', 'country': 'Pakistan'},
    {'name': 'London', 'country': 'United Kingdom'},
    {'name': 'Paris', 'country': 'France'},
    {'name': 'Tokyo', 'country': 'Japan'},
    {'name': 'New York', 'country': 'United States'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text(
          'City List Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF174EA6),
        centerTitle: true,
      ),

      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Showing 12 Major Cities (Scrollable ListView)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF174EA6),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 0,
                  ),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),

                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.location_city,
                        color: Color(0xFF174EA6),
                      ),
                    ),

                    title: Text(
                      cities[index]['name']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    subtitle: Text(
                      cities[index]['country']!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
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
