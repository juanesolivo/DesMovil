import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desmovil/main.dart';

void main() {
  testWidgets('App starts', (WidgetTester tester) async {
    await tester.pumpWidget(const AplicacionTienda());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}