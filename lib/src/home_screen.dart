import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './widgets/gauge_indicator.dart';

class HomeScreen extends StatelessWidget {
  double val = 0.0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Shrimplytics'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Dissolved Oxygen',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    GaugeIndicator(
                      inputValue: 0.34,
                      size: 200,
                    ),
                    Text(
                      '34 mg/L',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ]
                )
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Ammonia',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    GaugeIndicator(
                      inputValue: 0.5,
                      size: 200,
                    ),
                    Text(
                      '14 mg/L',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ]
                )
              ),
            ]
          ),
          Row(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Water Temperature',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    GaugeIndicator(
                      inputValue: 0.34,
                      size: 200,
                    ),
                    Text(
                      '34 mg/L',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ]
                )
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Ammonia',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    GaugeIndicator(
                      inputValue: 0.5,
                      size: 200,
                    ),
                    Text(
                      '14 mg/L',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ]
                )
              ),
            ]
          ),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0),
      ),
    );
  }
}
