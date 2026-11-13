import 'package:flutter/material.dart';
import '../models/student.dart';
import '../widgets/student_card.dart';
import '../widgets/dashboard_card.dart';
import 'profile_screen.dart';
import 'select_task_screen.dart';

class HomeDashboardScreen extends StatefulWidget {
  final Function(int)? onNavigateTab;

  const HomeDashboardScreen({
    super.key,
    this.onNavigateTab,
  });

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  String? _selectedTaskFromReturnData;

  Future<void> _openReturnDataDemo() async {
    // Demonstrates Returning Data: await Navigator.push(...)
    final String? result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const SelectTaskScreen()),
    );

    if (result != null && mounted) {
      setState(() {
        _selectedTaskFromReturnData = result;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Received returned data from screen: "$result"'),
          backgroundColor: Colors.blue.shade700,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const student = Student.currentStudent;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Welcome Message
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, ${student.name.split(' ')[0]}! 👋',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Student Hub Dashboard',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, size: 28, color: Colors.blue),
                onPressed: () {
                  if (widget.onNavigateTab != null) {
                    widget.onNavigateTab!(2); // Navigate to Reminders tab
                  }
                },
                tooltip: 'Reminders Tab',
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 2. Student Profile Hero Card
          StudentCard(
            student: student,
            onTap: () {
              // Basic Push & Hero Animation Demo
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const SizedBox(height: 16),

          // 3. Return Data Feature Banner
          Card(
            color: Colors.blue.shade50,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.blue.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.output_rounded, color: Colors.blue.shade800, size: 24),
                      const SizedBox(width: 10),
                      Text(
                        'Return Data Demonstration',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _selectedTaskFromReturnData != null
                        ? 'Selected Task Returned: "$_selectedTaskFromReturnData"'
                        : 'No task selected yet. Tap below to select a task and receive data back via Navigator.pop(context, value).',
                    style: TextStyle(
                      fontSize: 13,
                      color: _selectedTaskFromReturnData != null
                          ? Colors.blue.shade900
                          : Colors.grey.shade800,
                      fontWeight: _selectedTaskFromReturnData != null
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _openReturnDataDemo,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Open Select Task Screen (Return Data)'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 4. Dashboard Quick Action Cards Grid/List
          const Text(
            'Quick Navigation & Modules',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),

          DashboardCard(
            title: 'Tasks & Assignments',
            subtitle: 'TabBar & TabBarView (Upcoming, Completed, Pending, All)',
            icon: Icons.task_alt,
            iconBackgroundColor: Colors.blue,
            onTap: () {
              if (widget.onNavigateTab != null) {
                widget.onNavigateTab!(1);
              }
            },
          ),
          const SizedBox(height: 8),

          DashboardCard(
            title: 'Reminders & Schedule',
            subtitle: 'Class quizzes, lab submissions & study alerts',
            icon: Icons.notifications_active,
            iconBackgroundColor: Colors.purple,
            onTap: () {
              if (widget.onNavigateTab != null) {
                widget.onNavigateTab!(2);
              }
            },
          ),
          const SizedBox(height: 8),

          DashboardCard(
            title: 'About Student Hub',
            subtitle: 'Named Route (/about) • App overview & navigation docs',
            icon: Icons.info_outline,
            iconBackgroundColor: Colors.teal,
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          const SizedBox(height: 8),

          DashboardCard(
            title: 'Help & FAQ',
            subtitle: 'Named Route (/help) • Navigation principles guide',
            icon: Icons.help_outline,
            iconBackgroundColor: Colors.orange,
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          const SizedBox(height: 8),

          DashboardCard(
            title: 'Contact Support',
            subtitle: 'Named Route (/contact) • Academic services directory',
            icon: Icons.contact_support_outlined,
            iconBackgroundColor: Colors.indigo,
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
        ],
      ),
    );
  }
}
