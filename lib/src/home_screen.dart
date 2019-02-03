import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './widgets/gauge_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: GaugeIndicator(
          size: 300,
          inputValue: 100.0,
        ),
      )
    );
  }
}

