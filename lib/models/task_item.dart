enum TaskStatus { upcoming, completed, pending }

class TaskItem {
  final String id;
  final String title;
  final String course;
  final TaskStatus status;
  final DateTime dueDate;
  final String description;

  const TaskItem({
    required this.id,
    required this.title,
    required this.course,
    required this.status,
    required this.dueDate,
    required this.description,
  });

  String get statusName {
    switch (status) {
      case TaskStatus.upcoming:
        return 'Upcoming';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.pending:
        return 'Pending';
    }
  }

  static List<TaskItem> sampleTasks = [
    TaskItem(
      id: 't1',
      title: 'Mobile App Navigation Project',
      course: 'CS-402 Mobile Dev',
      status: TaskStatus.upcoming,
      dueDate: DateTime.now().add(const Duration(days: 2)),
      description: 'Implement push/pop, named routes, hero animation, and bottom nav.',
    ),
    TaskItem(
      id: 't2',
      title: 'Database Design Normalization',
      course: 'CS-305 Database Systems',
      status: TaskStatus.completed,
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
      description: 'Convert relational tables to 3NF and Boyce-Codd normal forms.',
    ),
    TaskItem(
      id: 't3',
      title: 'Algorithms Midterm Revision',
      course: 'CS-301 Algorithms',
      status: TaskStatus.pending,
      dueDate: DateTime.now().add(const Duration(days: 4)),
      description: 'Review Dijkstra graph search, Dynamic Programming, and Greedy strategies.',
    ),
    TaskItem(
      id: 't4',
      title: 'AI Ethics Presentation Deck',
      course: 'CS-480 Artificial Intelligence',
      status: TaskStatus.upcoming,
      dueDate: DateTime.now().add(const Duration(days: 5)),
      description: 'Prepare slides discussing safety alignment and automated decision models.',
    ),
    TaskItem(
      id: 't5',
      title: 'Software Testing & QA Lab',
      course: 'CS-410 Software Eng',
      status: TaskStatus.completed,
      dueDate: DateTime.now().subtract(const Duration(days: 3)),
      description: 'Write unit tests using JUnit and Mockito framework.',
    ),
  ];
}
