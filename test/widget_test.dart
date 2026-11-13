import 'package:flutter_test/flutter_test.dart';
import 'package:student_hub/main.dart';

void main() {
  testWidgets('Student Hub app renders main dashboard', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StudentHubApp());

    // Verify that Student Hub welcome message or title is present.
    expect(find.textContaining('Student Hub'), findsWidgets);
  });
}
