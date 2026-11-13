import 'package:flutter/material.dart';
import '../models/student.dart';
import '../screens/profile_screen.dart';

class AppDrawer extends StatelessWidget {
  final Function(int)? onSelectTab;

  const AppDrawer({
    super.key,
    this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    const student = Student.currentStudent;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.blue.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text(
              student.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: Text(student.email),
            currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: Hero(
                tag: 'student-profile-avatar-drawer',
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    student.name.isNotEmpty ? student.name[0] : 'S',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.dashboard_outlined, color: Colors.blue),
                  title: const Text('Home Dashboard'),
                  subtitle: const Text('Overview & quick actions'),
                  onTap: () {
                    Navigator.pop(context);
                    if (onSelectTab != null) {
                      onSelectTab!(0);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.task_alt_outlined, color: Colors.blue),
                  title: const Text('Tasks Management'),
                  subtitle: const Text('TabBar & TabBarView'),
                  onTap: () {
                    Navigator.pop(context);
                    if (onSelectTab != null) {
                      onSelectTab!(1);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_none_outlined, color: Colors.blue),
                  title: const Text('Reminders'),
                  subtitle: const Text('Study schedules'),
                  onTap: () {
                    Navigator.pop(context);
                    if (onSelectTab != null) {
                      onSelectTab!(2);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_outline, color: Colors.blue),
                  title: const Text('Student Profile'),
                  subtitle: const Text('Hero animation destination'),
                  onTap: () {
                    Navigator.pop(context);
                    if (onSelectTab != null) {
                      onSelectTab!(3);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      );
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings_outlined, color: Colors.blueGrey),
                  title: const Text('Settings'),
                  subtitle: const Text('Named Route (/settings)'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline, color: Colors.blueGrey),
                  title: const Text('Help & FAQ'),
                  subtitle: const Text('Named Route (/help)'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/help');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_support_outlined, color: Colors.blueGrey),
                  title: const Text('Contact Support'),
                  subtitle: const Text('Named Route (/contact)'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/contact');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline, color: Colors.blueGrey),
                  title: const Text('About Student Hub'),
                  subtitle: const Text('Named Route (/about)'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about');
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              'Student Hub v1.0.0 • Flutter Navigation',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
