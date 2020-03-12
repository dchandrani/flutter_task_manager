import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/utils/preference_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PreferenceManager>(
          create: (_) => PreferenceManager(),
        )
      ],
      child: MaterialApp(
        title: 'Task Manager',
        home: Consumer<PreferenceManager>(
          builder: (ctx, pref, child) {
            return FutureBuilder<bool>(
              future: pref.isLoggedIn(),
              builder: (ctx, snap) {
                if (!snap.hasData) {
                  return LoginScreen();
                }

                if (snap.data) {
                  return HomeScreen();
                } else {
                  return LoginScreen();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
