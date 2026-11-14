import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

// About Screen - Displays exactly 6 items in a 2-column GridView
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const Color darkBlue = Color(0xFF0D47A1);

  // Exactly 6 grid items with icons and captions
  final List<Map<String, dynamic>> _gridItems = const [
    {
      'icon': Icons.school,
      'title': 'Student Hub',
      'caption': 'Central Campus Portal',
    },
    {
      'icon': Icons.local_library,
      'title': 'Library Access',
      'caption': 'Digital Books & Study Pods',
    },
    {
      'icon': Icons.event_note,
      'title': 'Exam Schedule',
      'caption': 'Timetables & Quiz Dates',
    },
    {
      'icon': Icons.map,
      'title': 'Campus Map',
      'caption': 'Building & Room Directions',
    },
    {
      'icon': Icons.contact_support,
      'title': 'Student Support',
      'caption': 'Academic Counseling & Help',
    },
    {
      'icon': Icons.book,
      'title': 'Course Catalog',
      'caption': 'Syllabus & Degree Paths',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar with Dark Blue theme
      appBar: AppBar(
        title: const Text('About Screen GridView'),
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
      ),
      // Drawer Navigation
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtitle banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                'Showing exactly ${_gridItems.length} items in a 2-Column GridView',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 2-Column GridView displaying exactly 6 items
            Expanded(
              child: GridView.builder(
                itemCount: _gridItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final item = _gridItems[index];
                  return Card(
                    elevation: 0,
                    color: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tapped: ${item['title']}'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                item['icon'] as IconData,
                                color: darkBlue,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['title'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['caption'] as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
