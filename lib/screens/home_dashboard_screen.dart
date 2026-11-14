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
  static const darkBlue = Color(0xFF0D47A1);
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
          content: Text('Received returned data: "$result"'),
          backgroundColor: darkBlue,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const student = Student.currentStudent;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Welcome Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, ${student.name.split(' ')[0]} 👋',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Student Hub Dashboard',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none, size: 26, color: darkBlue),
                  onPressed: () {
                    if (widget.onNavigateTab != null) {
                      widget.onNavigateTab!(2); // Navigate to Reminders tab
                    }
                  },
                  tooltip: 'Reminders',
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 2. Student Profile Hero Card
            StudentCard(
              student: student,
              onTap: () {
                // Push to ProfileScreen with Hero Animation
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
            const SizedBox(height: 16),

            // 3. Return Data Feature Banner
            Card(
              elevation: 0,
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.swap_horizontal_circle, color: darkBlue, size: 22),
                        SizedBox(width: 8),
                        Text(
                          'Return Data Feature',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _selectedTaskFromReturnData != null
                          ? 'Returned Task: "$_selectedTaskFromReturnData"'
                          : 'Select a task from the list to demonstrate Navigator.pop(context, value).',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade800,
                        fontWeight: _selectedTaskFromReturnData != null
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      ),
                      onPressed: _openReturnDataDemo,
                      icon: const Icon(Icons.add_task, size: 18),
                      label: const Text('Select Task (Return Data)'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 4. Quick Action Navigation Cards
            const Text(
              'Quick Actions & Modules',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            DashboardCard(
              title: 'Tasks & Assignments',
              subtitle: 'TabBar View • Upcoming, Completed, Pending',
              icon: Icons.task_alt,
              onTap: () {
                if (widget.onNavigateTab != null) {
                  widget.onNavigateTab!(1);
                }
              },
            ),
            const SizedBox(height: 8),

            DashboardCard(
              title: 'Reminders & Schedule',
              subtitle: 'Class quizzes, lab submissions & alerts',
              icon: Icons.alarm,
              onTap: () {
                if (widget.onNavigateTab != null) {
                  widget.onNavigateTab!(2);
                }
              },
            ),
            const SizedBox(height: 8),

            DashboardCard(
              title: 'About Student Hub',
              subtitle: 'Named Route (/about) • Application overview',
              icon: Icons.info_outline,
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            const SizedBox(height: 8),

            DashboardCard(
              title: 'Help & FAQ',
              subtitle: 'Named Route (/help) • Navigation guide',
              icon: Icons.help_outline,
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
            ),
            const SizedBox(height: 8),

            DashboardCard(
              title: 'Contact Support',
              subtitle: 'Named Route (/contact) • Academic directory',
              icon: Icons.contact_support_outlined,
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
    );
  }
}
