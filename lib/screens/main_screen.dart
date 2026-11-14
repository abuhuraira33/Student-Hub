import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'home_dashboard_screen.dart';
import 'tasks_screen.dart';
import 'reminders_screen.dart';
import 'profile_screen.dart';
import 'select_task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const darkBlue = Color(0xFF0D47A1);

  int _currentIndex = 0;
  bool _useBottomAppBarMode = false;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _showFabSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: darkBlue,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'DISMISS',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  Future<void> _handleFabAction() async {
    _showFabSnackBar('FloatingActionButton Pressed! Opening Select Task Screen...');

    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const SelectTaskScreen()),
    );

    if (result != null && mounted) {
      _showFabSnackBar('Task Selected & Returned: "$result"');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeDashboardScreen(onNavigateTab: _onTabSelected),
      const TasksScreen(),
      const RemindersScreen(),
      const ProfileScreen(isHeroDestination: false),
    ];

    final List<String> titles = [
      'Student Hub • Dashboard',
      'Tasks & Assignments',
      'Reminders & Study Alerts',
      'Student Profile',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _currentIndex == 1
          ? null
          : AppBar(
              title: Text(titles[_currentIndex]),
              backgroundColor: darkBlue,
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Icon(
                    _useBottomAppBarMode
                        ? Icons.view_day_outlined
                        : Icons.call_to_action_outlined,
                  ),
                  tooltip: _useBottomAppBarMode
                      ? 'Switch to BottomNavigationBar'
                      : 'Switch to BottomAppBar & FAB mode',
                  onPressed: () {
                    setState(() {
                      _useBottomAppBarMode = !_useBottomAppBarMode;
                    });
                    _showFabSnackBar(
                      _useBottomAppBarMode
                          ? 'Switched to BottomAppBar + FAB mode'
                          : 'Switched to 4-Tab BottomNavigationBar mode',
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Settings',
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
      drawer: AppDrawer(onSelectTab: _onTabSelected),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: 'main-fab-plus',
        onPressed: _handleFabAction,
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
        elevation: 2,
        tooltip: 'Quick Add / Select Task (FAB)',
        child: const Icon(Icons.add, size: 28),
      ),
      floatingActionButtonLocation: _useBottomAppBarMode
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: _useBottomAppBarMode
          ? BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              color: darkBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    tooltip: 'Home',
                    onPressed: () {
                      _onTabSelected(0);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    tooltip: 'Tasks',
                    onPressed: () {
                      _onTabSelected(1);
                    },
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.white),
                    tooltip: 'Reminders',
                    onPressed: () {
                      _onTabSelected(2);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white),
                    tooltip: 'Profile',
                    onPressed: () {
                      _onTabSelected(3);
                    },
                  ),
                ],
              ),
            )
          : BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTabSelected,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: darkBlue,
              unselectedItemColor: Colors.grey.shade600,
              backgroundColor: Colors.white,
              elevation: 4,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt_outlined),
                  activeIcon: Icon(Icons.task_alt),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_outlined),
                  activeIcon: Icon(Icons.notifications),
                  label: 'Reminders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
    );
  }
}
