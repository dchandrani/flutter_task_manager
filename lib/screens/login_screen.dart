import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/models/login_response.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/register_screen.dart';
import '../utils/preference_manager.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  login(PreferenceManager preferenceManager, BuildContext context) async {
    var body = Map<String, dynamic>();
    body['email'] = 'dhruv.chandrani@gmail.com';
    body['password'] = '123456';

    final response = await http.post(
      'http://192.168.0.105/task_manager/v1/login',
      body: body,
    );

    if (response.statusCode == 200) {
      var loginResponse = LoginResponse.fromJson(json.decode(response.body));

      if (!loginResponse.error) {
        await preferenceManager.saveApiKey(loginResponse.apiKey);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
      }
    } else {
      print('Failed to login');
      throw Exception('Failed to login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<PreferenceManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14.0),
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          SizedBox(height: 12.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          SizedBox(height: 18.0),
          RaisedButton(
            onPressed: () async => login(pref, context),
            child: Text('Login'),
          ),
          SizedBox(height: 40.0),
          Row(
            children: <Widget>[
              Text('Not a member?'),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                    fullscreenDialog: true,
                  ));
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
