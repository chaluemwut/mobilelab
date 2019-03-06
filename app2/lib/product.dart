import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LandingScreen extends StatefulWidget {
  int _userId;

  LandingScreen(int userId) {
    this._userId = userId;
  }

  @override
  State<StatefulWidget> createState() {
    return _LandingScreen(this._userId);
  }
}

class _LandingScreen extends State {
  int _userId;

  _LandingScreen(int userId) {
    this._userId = userId;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('โชว์ห่วย 2019'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ProductSaveScreen(this._userId)));
            },
            child: Icon(Icons.add)));
  }
}

class ProductSaveScreen extends StatefulWidget {
  int _userId;

  ProductSaveScreen(int userId) {
    this._userId = userId;
  }

  @override
  State<StatefulWidget> createState() {
    return _ProductSaveScreen(this._userId);
  }
}

class _ProductSaveScreen extends State {
  int _userId;
  TextEditingController _name = TextEditingController();
  TextEditingController _detail = TextEditingController();
  TextEditingController _price = TextEditingController();

  _ProductSaveScreen(int userId) {
    this._userId = userId;
  }

  void onSave() {
    http.post('http://172.25.41.180:8080/product/save', body: {
      'name': _name.text,
      'description': _detail.text,
      'price': _price.text,
      'userId': '${this._userId}'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึกสินค้า'),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: ': ชื่อสินค้า'),
            controller: _name,
          ),
          TextField(
            decoration: InputDecoration(hintText: ': รายละเอียด'),
            controller: _detail,
          ),
          TextField(
            decoration: InputDecoration(hintText: ': ราคาสินค้า'),
            controller: _price,
          ),
          RaisedButton(
            onPressed: onSave,
            child: Text('บันทึก'),
          )
        ],
      ),
    );
  }
}
