import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14.0),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Name'),
          ),
          SizedBox(height: 12.0),
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
            onPressed: () {},
            child: Text('Register'),
          ),
          SizedBox(height: 40.0),
          Row(
            children: <Widget>[
              Text('Already member?'),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Login',
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
