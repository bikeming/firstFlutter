import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ImageWidget"),
      ),
      body: Center(
        child: Image.asset(
          "lib/images/avator.png",
          width: 300,
          height: 300,
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}
