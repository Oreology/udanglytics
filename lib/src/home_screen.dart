import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './widgets/gauge_indicator.dart';

class HomeScreen extends StatelessWidget {
  double val = 0.0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: GaugeIndicator(
          inputValue: 1,
          size: 200,
        )
      )
    );
  }
}
