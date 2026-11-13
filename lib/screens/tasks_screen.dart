import 'package:flutter/material.dart';
import '../models/task_item.dart';
import '../widgets/task_tile.dart';
import 'select_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<TaskItem> _tasks = List.from(TaskItem.sampleTasks);
  String? _returnedTaskResult;

  Future<void> _openSelectTaskScreen() async {
    // Return Data pattern: Navigator.push awaits Navigator.pop(context, result)
    final String? result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const SelectTaskScreen()),
    );

    if (result != null && result.isNotEmpty && mounted) {
      setState(() {
        _returnedTaskResult = result;
        _tasks.insert(
          0,
          TaskItem(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            title: result,
            course: 'Selected / Custom Task',
            status: TaskStatus.upcoming,
            dueDate: DateTime.now().add(const Duration(days: 3)),
            description: 'Task added via Navigator.pop(context, value) return data mechanism.',
          ),
        );
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Returned Data Received: "$result"'),
          backgroundColor: Colors.blue.shade800,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Tasks & Assignments'),
          backgroundColor: Colors.blue.shade700,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.add_task),
              tooltip: 'Select Task (Return Data Demo)',
              onPressed: _openSelectTaskScreen,
            ),
          ],
          bottom: const TabBar(
            isScrollable: false,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.schedule), text: 'Upcoming'),
              Tab(icon: Icon(Icons.check_circle_outline), text: 'Completed'),
              Tab(icon: Icon(Icons.pending_actions), text: 'Pending'),
              Tab(icon: Icon(Icons.list_alt), text: 'All Tasks'),
            ],
          ),
        ),
        body: Column(
          children: [
            if (_returnedTaskResult != null)
              Container(
                color: Colors.blue.shade50,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.assignment_turned_in, color: Colors.blue.shade800, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Latest Returned Task: "$_returnedTaskResult"',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: () {
                        setState(() {
                          _returnedTaskResult = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: Upcoming Tasks
                  _buildTaskList(
                    _tasks.where((t) => t.status == TaskStatus.upcoming).toList(),
                    'No upcoming tasks right now!',
                  ),
                  // Tab 2: Completed Tasks
                  _buildTaskList(
                    _tasks.where((t) => t.status == TaskStatus.completed).toList(),
                    'No completed tasks yet.',
                  ),
                  // Tab 3: Pending Tasks
                  _buildTaskList(
                    _tasks.where((t) => t.status == TaskStatus.pending).toList(),
                    'No pending tasks.',
                  ),
                  // Tab 4: All Tasks
                  _buildTaskList(
                    _tasks,
                    'No tasks available.',
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: 'fab-select-task-returned',
          onPressed: _openSelectTaskScreen,
          backgroundColor: Colors.blue.shade700,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.swap_horizontal_circle),
          label: const Text('Return Data Demo'),
        ),
      ),
    );
  }

  Widget _buildTaskList(List<TaskItem> list, String emptyMessage) {
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox, size: 60, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              emptyMessage,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return TaskTile(
          task: list[index],
          onTap: () {
            _showTaskDetailsDialog(list[index]);
          },
        );
      },
    );
  }

  void _showTaskDetailsDialog(TaskItem task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(task.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Course: ${task.course}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('Status: ${task.statusName}'),
            const SizedBox(height: 6),
            Text('Due Date: ${task.dueDate.month}/${task.dueDate.day}/${task.dueDate.year}'),
            const SizedBox(height: 12),
            Text(task.description, style: TextStyle(color: Colors.grey.shade800)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
