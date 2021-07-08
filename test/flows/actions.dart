import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matcher.dart';

Future<void> clickOnTheTransferFeatureItem(WidgetTester tester) async {
  final transferFeatureItem = find.byWidgetPredicate(
    (widget) => featureItemMatch(widget, 'Transfer', Icons.monetization_on),
  );
  expect(transferFeatureItem, findsOneWidget);
  return tester.tap(transferFeatureItem);
}
