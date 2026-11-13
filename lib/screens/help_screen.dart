import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How does Navigator.push and pop work?',
      'answer':
          'Navigator.push places a new route screen onto the top of the navigation stack. Navigator.pop removes the top route from the stack and returns to the previous screen.',
    },
    {
      'question': 'What are Named Routes in Flutter?',
      'answer':
          'Named routes define a string mapping in MaterialApp routes parameter (e.g., "/about": (context) => AboutScreen()). You can navigate using Navigator.pushNamed(context, "/about").',
    },
    {
      'question': 'How does Hero Animation work?',
      'answer':
          'Wrap identical visual elements (like an image or avatar) in a Hero widget on both source and destination screens, giving them matching "tag" properties.',
    },
    {
      'question': 'How do I return data from a pushed screen?',
      'answer':
          'Use await Navigator.push(...) on the caller side, and Navigator.pop(context, returnData) on the popped screen. The caller receives the returned data value asynchronously.',
    },
    {
      'question': 'What is the difference between TabBar and BottomNavigationBar?',
      'answer':
          'TabBar is combined with TabBarView and DefaultTabController for swipable sub-views (e.g. task categories). BottomNavigationBar switches top-level app screens.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & FAQs'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue.shade50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.blue.shade200),
              ),
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(Icons.help_center, color: Colors.blue, size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Opened via Named Route: "/help". Demonstrates Flutter Navigation principles.',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      radius: 16,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    title: Text(
                      faq['question']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Text(
                          faq['answer']!,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            height: 1.4,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Previous Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
