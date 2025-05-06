import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:day16_shopping/main.dart'; // Ensure this points to the main.dart file

void main() {
  testWidgets('HomePage widget test', (WidgetTester tester) async {
    // Build the app and trigger a frame with the HomePage widget
    await tester.pumpWidget(MaterialApp(
      home: HomePage(), // Use HomePage directly here
    ));

    // Verify that the "Get Start" button exists
    expect(find.text("Get Start"), findsOneWidget);
    
    // Tap the 'Get Start' button
    await tester.tap(find.text('Get Start'));
    
    // Wait for animations to complete
    await tester.pumpAndSettle(); // This will ensure all animations are complete

    // Verify that after tapping, the animation happens (you could verify by checking if some text or widget exists)
    // For simplicity, checking if the "Create Account" button exists.
    expect(find.text("Create Account"), findsOneWidget);
  });
}
