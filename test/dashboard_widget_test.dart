import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'matcher.dart';

void main() {
  testWidgets('Should display the main image when the Dashboard is opened',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets(
      'Should display the transfer feature when the Dashboard is opened',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final transferFeature = find.byWidgetPredicate((widget) =>
        featureItemMatch(widget, 'Transfer', Icons.monetization_on));

    expect(transferFeature, findsOneWidget);
  });

  testWidgets(
      'Should display the transaction feed feature when the Dashboard is opened',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    // final iconTransactionFeedFeatureIcon =
    //     find.widgetWithIcon(FeatureItem, Icons.description);
    // expect(iconTransactionFeedFeatureIcon, findsOneWidget);
    // final textTransactionFeedFeatureIcon =
    //     find.widgetWithText(FeatureItem, 'Transaction Feed');
    // expect(textTransactionFeedFeatureIcon, findsOneWidget);
    final transactionFeedFeature = find.byWidgetPredicate((widget) =>
        featureItemMatch(widget, 'Transaction Feed', Icons.description));

    expect(transactionFeedFeature, findsOneWidget);
  });
}
