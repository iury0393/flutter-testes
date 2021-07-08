import 'package:bytebank/main.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../matchers/matcher.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  MockContactDao mockContactDao;
  MockTransactionWebClient mockTransactionWebClient;

  setUp(() async {
    mockContactDao = MockContactDao();
    mockTransactionWebClient = MockTransactionWebClient();
  });
  testWidgets('Should save a contact', (tester) async {
    await tester.pumpWidget(BytebankApp(
      contactDao: mockContactDao,
      transactionWebClient: mockTransactionWebClient,
    ));

    await clickOnTheTransferFeatureItem(tester);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    verify(mockContactDao.findAll()).called(1);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    final nameTextField = find
        .byWidgetPredicate((widget) => textFieldMatcher(widget, 'Full name'));
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'Iury');

    final valueTextField = find.byWidgetPredicate(
        (widget) => textFieldMatcher(widget, 'Account number'));
    expect(valueTextField, findsOneWidget);
    await tester.enterText(valueTextField, '1000');

    final createBtn = find.widgetWithText(RaisedButton, 'Create');
    expect(createBtn, findsOneWidget);
    await tester.tap(createBtn);
    await tester.pumpAndSettle();

    verify(mockContactDao.save(Contact(0, 'Iury', 1000)));

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);

    verify(mockContactDao.findAll());
  });
}
