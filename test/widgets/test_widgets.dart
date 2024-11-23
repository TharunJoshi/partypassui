import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:partypassui/widgets/custom_button.dart';

void main() {
  testWidgets('CustomButton renders correctly', (WidgetTester tester) async {
    bool buttonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            label: 'Test Button',
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );

    // Verify button renders
    expect(find.text('Test Button'), findsOneWidget);

    // Simulate button press
    await tester.tap(find.text('Test Button'));
    await tester.pump();

    // Verify button action
    expect(buttonPressed, true);
  });
}
