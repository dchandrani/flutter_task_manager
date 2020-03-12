import 'package:flutter/material.dart';
import 'package:task_manager/screens/register_screen.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  Future<http.Response> login() async {
    var body = Map<String, dynamic>();
    body['email'] = 'dhruv.chandrani@gmail.com';
    body['password'] = '123456';

    return await http.post(
      'http://192.168.0.105/task_manager/v1/login',
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () async {
              var response = await login();
              print(response);
            },
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
