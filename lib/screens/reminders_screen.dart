import 'package:flutter/material.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final List<Map<String, dynamic>> _reminders = [
    {
      'title': 'Mobile Development Quiz 2',
      'time': 'Today at 3:00 PM',
      'location': 'Lab Room 104',
      'isDone': false,
    },
    {
      'title': 'Submit Database Assignment',
      'time': 'Tomorrow at 11:59 PM',
      'location': 'Online Portal',
      'isDone': false,
    },
    {
      'title': 'Group Project Meeting',
      'time': 'Thursday at 4:30 PM',
      'location': 'Library Study Pod B',
      'isDone': true,
    },
    {
      'title': 'Algorithms Midterm Exam',
      'time': 'Next Monday at 10:00 AM',
      'location': 'Auditorium Hall A',
      'isDone': false,
    },
  ];

  void _addReminder() {
    showDialog(
      context: context,
      builder: (context) {
        final titleController = TextEditingController();
        final timeController = TextEditingController();

        return AlertDialog(
          title: const Text('Add New Reminder'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Reminder Title',
                  hintText: 'e.g. Science Fair Submission',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Date & Time',
                  hintText: 'e.g. Friday at 2:00 PM',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.trim().isNotEmpty) {
                  setState(() {
                    _reminders.add({
                      'title': titleController.text.trim(),
                      'time': timeController.text.trim().isEmpty
                          ? 'Today'
                          : timeController.text.trim(),
                      'location': 'Campus',
                      'isDone': false,
                    });
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('New reminder created!')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue.shade700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.alarm, color: Colors.blue),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Student Reminders',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Stay organized for classes, quizzes & exams.',
                            style: TextStyle(
                              color: Colors.blue.shade100,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle, color: Colors.white, size: 28),
                      onPressed: _addReminder,
                      tooltip: 'Add Reminder',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Upcoming Schedule',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Chip(
                  avatar: const Icon(Icons.notifications_active, size: 16),
                  label: Text('${_reminders.where((r) => !r['isDone']).length} Active'),
                  backgroundColor: Colors.blue.shade50,
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _reminders.length,
              itemBuilder: (context, index) {
                final item = _reminders[index];
                final bool isDone = item['isDone'];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      activeColor: Colors.blue.shade700,
                      value: isDone,
                      onChanged: (val) {
                        setState(() {
                          _reminders[index]['isDone'] = val ?? false;
                        });
                      },
                    ),
                    title: Text(
                      item['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: isDone ? TextDecoration.lineThrough : null,
                        color: isDone ? Colors.grey : Colors.black87,
                      ),
                    ),
                    subtitle: Text('${item['time']} • ${item['location']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20, color: Colors.redAccent),
                      onPressed: () {
                        setState(() {
                          _reminders.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Reminder removed')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'fab-add-reminder',
        onPressed: _addReminder,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('New Reminder'),
      ),
    );
  }
}
