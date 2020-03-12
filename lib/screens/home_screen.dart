import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_manager/screens/login_screen.dart';
import '../utils/preference_manager.dart';

class HomeScreen extends StatelessWidget {
  logout(PreferenceManager preferenceManager, BuildContext ctx) async {
    await preferenceManager.logout();

    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<PreferenceManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Logout'),
          onPressed: () => logout(pref, context),
        ),
      ),
    );
  }
}
