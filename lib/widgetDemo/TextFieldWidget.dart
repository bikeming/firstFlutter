import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return new Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new TextField(
              decoration: InputDecoration(
                  hintText: "请输入账号",
                  contentPadding: EdgeInsets.all(10),
                  icon: Icon(Icons.text_fields),
                  labelText: "账号"),
              autofocus: false,
              onChanged: _textFieldChanged,
              controller: controller,
            ),
            new RaisedButton(
              onPressed: () {
                _onPress(controller.text.toString());
              },
              elevation: 8,
              child: Text("获取输入框"),
            )
          ],
        ),
      ),
    );
  }

  void _textFieldChanged(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.lightBlue);
  }

  void _onPress(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.lightBlue);
  }
}
