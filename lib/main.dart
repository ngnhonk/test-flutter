import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/main_screen.dart';
import 'package:task/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase init error: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<DatabaseService>(
      create: (_) => DatabaseService(),
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainScreen(),
      ),
    );
  }
}