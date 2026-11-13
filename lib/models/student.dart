class Student {
  final String id;
  final String name;
  final String email;
  final String major;
  final String year;
  final double gpa;
  final String avatarUrl;

  const Student({
    required this.id,
    required this.name,
    required this.email,
    required this.major,
    required this.year,
    required this.gpa,
    required this.avatarUrl,
  });

  static const Student currentStudent = Student(
    id: 'STU-2026-8942',
    name: 'Alex Morgan',
    email: 'alex.morgan@student.edu',
    major: 'Computer Science',
    year: 'Senior (Year 4)',
    gpa: 3.85,
    avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
  );
}
