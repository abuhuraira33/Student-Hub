import 'package:flutter_test/flutter_test.dart';
import 'package:student_hub/main.dart';

void main() {
  testWidgets('Student Hub renders splash screen and navigates to home screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StudentHubApp());

    // Verify splash screen renders initially
    expect(find.text('Student Hub'), findsWidgets);

    // Advance time by 3 seconds to complete splash screen timer and navigation
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Verify that Student Hub home screen is displayed
    expect(find.text('Student Hub - Home'), findsOneWidget);
  });
}
