import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './widgets/gauge_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  double val;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          GaugeIndicator(inputValue: val, size: 300),
          Slider(value: val,
          min: 0.0,
          max: 1.0,
          onChanged: (sliderInput) {
            setState(() {
              val = sliderInput;
            });
          }
          ),
        ])
    )
    );
  }
}
