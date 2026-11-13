import 'package:flutter/material.dart';

class SelectTaskScreen extends StatefulWidget {
  const SelectTaskScreen({super.key});

  @override
  State<SelectTaskScreen> createState() => _SelectTaskScreenState();
}

class _SelectTaskScreenState extends State<SelectTaskScreen> {
  final TextEditingController _customTaskController = TextEditingController();

  final List<String> _availableTasks = [
    'Mobile App Navigation Project (Due Friday)',
    'Database Systems Normalization Assignment',
    'Algorithms Graph Traversal Practice',
    'AI Ethics Essay & Slide Deck',
    'Software Testing Unit Tests Lab',
    'Computer Networks Lab 3 Wireshark Analysis',
    'Operating Systems Memory Management Study',
  ];

  String? _selectedTask;

  @override
  void dispose() {
    _customTaskController.dispose();
    super.dispose();
  }

  void _returnSelectedTask(String taskTitle) {
    if (taskTitle.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter or select a valid task name')),
      );
      return;
    }
    // Return data back to caller via Navigator.pop(context, value)
    Navigator.pop(context, taskTitle.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return Data Demo: Select Task'),
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
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(Icons.swap_horizontal_circle, color: Colors.blue.shade800, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'This screen demonstrates returning data to the previous screen using Navigator.pop(context, result).',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Custom Task Input:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _customTaskController,
                    decoration: InputDecoration(
                      hintText: 'Enter custom task title...',
                      prefixIcon: const Icon(Icons.add_task),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  onPressed: () {
                    _returnSelectedTask(_customTaskController.text);
                  },
                  child: const Text('Return Data'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Or Select a Predefined Task:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _availableTasks.length,
              itemBuilder: (context, index) {
                final task = _availableTasks[index];
                final isSelected = _selectedTask == task;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: isSelected ? Colors.blue.shade700 : Colors.grey.shade300,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      task,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.blue.shade800 : Colors.black87,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: Colors.blue.shade700)
                        : const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () {
                      setState(() {
                        _selectedTask = task;
                        _customTaskController.text = task;
                      });
                      _returnSelectedTask(task);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
