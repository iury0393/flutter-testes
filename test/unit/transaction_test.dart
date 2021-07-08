import 'package:bytebank/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Transactions Tests', () {
    test('Should return value when make a transaction', () {
      final transaction = Transaction(null, 200, null);
      expect(transaction.value, 200);
    });

    test('Shoul throw a error when value is less than zero', () {
      expect(() => Transaction(null, 0, null), throwsAssertionError);
    });
  });
}
