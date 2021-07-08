import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matcher.dart';

void main() {
  group('When Dashboard is opened', () {
    testWidgets('Should display the main image', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Dashboard()));
      final mainImage = find.byType(Image);
      expect(mainImage, findsOneWidget);
    });

    testWidgets('Should display the transfer feature', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Dashboard()));
      final transferFeature = find.byWidgetPredicate((widget) =>
          featureItemMatch(widget, 'Transfer', Icons.monetization_on));

      expect(transferFeature, findsOneWidget);
    });

    testWidgets('Should display the transaction feed feature', (tester) async {
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
  });
}
