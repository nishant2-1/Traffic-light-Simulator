import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:traffic_sim_flutter/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const TrafficSimApp());

    // Verify app loads.
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify bottom navigation exists.
    expect(find.byIcon(Icons.map), findsOneWidget);
    expect(find.byIcon(Icons.traffic), findsOneWidget);
    expect(find.byIcon(Icons.bar_chart), findsOneWidget);

    expect(find.text('Map'), findsOneWidget);
    expect(find.text('Simulation'), findsOneWidget);
    expect(find.text('Reports'), findsOneWidget);
  });
}
