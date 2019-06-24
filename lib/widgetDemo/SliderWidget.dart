import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SliderState();
  }
}

class SliderState extends State<SliderWidget> {
  double v = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('SliderWidget'),
      ),
      body: new Center(
        child: new Slider(
          value: v,
          label: '$v',
          divisions: 100,
          min: 0.0,
          max: 100,
          activeColor: Colors.lightBlue,
          inactiveColor: Colors.grey,
          onChanged: (double newValue) {
            setState(() {
              this.v = newValue.roundToDouble();
            });
          },
        ),
      ),
    );
  }
}
