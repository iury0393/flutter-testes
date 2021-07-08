import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:flutter/material.dart';

class AppDependecies extends InheritedWidget {
  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  AppDependecies({
    @required this.contactDao,
    @required this.transactionWebClient,
    @required Widget child,
  }) : super(child: child);

  static AppDependecies of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDependecies>();

  @override
  bool updateShouldNotify(AppDependecies oldWidget) {
    return contactDao != oldWidget.contactDao ||
        transactionWebClient != oldWidget.transactionWebClient;
  }
}
