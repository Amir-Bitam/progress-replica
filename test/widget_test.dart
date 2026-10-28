import 'package:flutter_test/flutter_test.dart';
import 'package:student_portal/main.dart';
import 'package:student_portal/screens/splash_screen.dart';

void main() {
  testWidgets('starts on the splash screen', (tester) async {
    await tester.pumpWidget(const StudentPortalApp());
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
