import 'package:bytebank/main.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'matcher.dart';
import 'mocks.dart';

void main() {
  testWidgets('Should save a contact', (tester) async {
    final mockContactDao = MockContactDao();
    await tester.pumpWidget(BytebankApp(
      contactDao: mockContactDao,
    ));

    final transferFeatureItem = find.byWidgetPredicate(
      (widget) => featureItemMatch(widget, 'Transfer', Icons.monetization_on),
    );
    expect(transferFeatureItem, findsOneWidget);
    await tester.tap(transferFeatureItem);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    final nameTextField = find.byWidgetPredicate((widget) {
      if (widget is TextField) {
        return widget.decoration.labelText == 'Full name';
      }
      return false;
    });
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'Iury');

    final valueTextField = find.byWidgetPredicate((widget) {
      if (widget is TextField) {
        return widget.decoration.labelText == 'Account number';
      }
      return false;
    });
    expect(valueTextField, findsOneWidget);
    await tester.enterText(valueTextField, '1000');

    final createBtn = find.widgetWithText(RaisedButton, 'Create');
    expect(createBtn, findsOneWidget);
    await tester.tap(createBtn);
    await tester.pumpAndSettle();

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);
  });
}
