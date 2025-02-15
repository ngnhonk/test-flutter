import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/services/database_service.dart';

class DatabaseProvider extends StatelessWidget {
  final Widget child;

  const DatabaseProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<DatabaseService>(
      create: (_) => DatabaseService(),
      child: child,
    );
  }
}
