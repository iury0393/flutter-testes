import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:flutter/material.dart';

class AppDependecies extends InheritedWidget {
  final ContactDao contactDao;

  AppDependecies({@required this.contactDao, @required Widget child})
      : super(child: child);

  static AppDependecies of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDependecies>();

  @override
  bool updateShouldNotify(AppDependecies oldWidget) =>
      contactDao != oldWidget.contactDao;
}
