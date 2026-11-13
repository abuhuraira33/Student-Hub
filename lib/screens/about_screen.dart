import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Student Hub'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.school_rounded,
                      size: 60,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Student Hub',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const Text(
                    'Integrated Flutter Navigation Utility App',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Demonstrated Navigation Concepts:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildFeatureTile(
              num: '1',
              title: 'Basic Push & Pop',
              subtitle: 'Navigator.push and Navigator.pop for stack screen transitions',
            ),
            _buildFeatureTile(
              num: '2',
              title: 'Named Routes',
              subtitle: 'MaterialApp routes table and Navigator.pushNamed navigation',
            ),
            _buildFeatureTile(
              num: '3',
              title: 'Hero Animation',
              subtitle: 'Shared element avatar animation between Home and Profile screens',
            ),
            _buildFeatureTile(
              num: '4',
              title: 'BottomNavigationBar',
              subtitle: 'Stateful tab bar switching between Home, Tasks, Reminders, and Profile',
            ),
            _buildFeatureTile(
              num: '5',
              title: 'BottomAppBar & FAB',
              subtitle: 'Custom bottom navigation bar with central FloatingActionButton & SnackBar',
            ),
            _buildFeatureTile(
              num: '6',
              title: 'TabBar & TabBarView',
              subtitle: 'DefaultTabController with horizontal swiping across task categories',
            ),
            _buildFeatureTile(
              num: '7',
              title: 'Drawer & ListView',
              subtitle: 'UserAccountsDrawerHeader sidebar drawer with quick navigation links',
            ),
            _buildFeatureTile(
              num: '8',
              title: 'Return Data from Screen',
              subtitle: 'Selecting a task and sending data back via Navigator.pop(context, value)',
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contact');
                    },
                    icon: const Icon(Icons.email),
                    label: const Text('Contact Us'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/help');
                    },
                    icon: const Icon(Icons.help),
                    label: const Text('Help & FAQ'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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

  Widget _buildFeatureTile({
    required String num,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.blue.shade700,
            child: Text(
              num,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
