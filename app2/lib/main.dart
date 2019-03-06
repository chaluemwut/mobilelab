import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product.dart';

void main() {
  runApp(MaterialApp(
    home: ECPApp(),
  ));
}

class ECPApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ECPApp();
  }
}

class _ECPApp extends State {
  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();

  void onLogin() {
    Map<String, dynamic> param = Map();
    param['userName'] = _userName.text;
    param['passWord'] = _passWord.text;
    http
        .post('http://172.25.41.180:8080/user/login', body: param)
        .then((response) {
      Map resMap = jsonDecode(response.body) as Map;
      if (resMap['status'] == 0) {
        int userId = resMap['data'];
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => LandingScreen(userId)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ECP app'),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: _userName,
          ),
          TextField(
            controller: _passWord,
            obscureText: true,
          ),
          Center(
            child: FlatButton(onPressed: null, child: Text('ลงทะเบียน')),
          ),
          RaisedButton(
            child: Text('ตกลง'),
            onPressed: onLogin,
          )
        ],
      ),
    );
  }
}

class Registor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Registor();
  }
}

class _Registor extends State {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
