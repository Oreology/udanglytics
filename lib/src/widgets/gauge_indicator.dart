import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class Indicator extends StatelessWidget  {
  Indicator({this.size = 300.0,this.indicatorColor = Colors.black, this.inputValue = 0.0});

  final double size;
  final Color indicatorColor  ;
  final double inputValue;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      origin: Offset(0.0, 0.0),
      angle: -1.97 + (2*1.97*inputValue),
      child: ClipPath(
        clipper: IndicatorClipper(),
        child: Container(
          width: size/20,
          height: size*0.9,
          color: indicatorColor,
        ),
      ),
    );
  }
}

class IndicatorClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width/2, 0.0);
    path.lineTo(size.width/1, size.height/2);
    path.lineTo(-size.width/2, size.height/2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }

}

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;


  GaugeChart(this.seriesList, {this.animate});

  factory GaugeChart.withSampleData() {
    return new GaugeChart(
      _createSampleData(),
      animate: false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 30, startAngle: 4 / 5 * pi, arcLength: 7 / 5 * pi));
  }

  static List<charts.Series<GaugeSegment, String>> _createSampleData() {
  
    final data = [
      new GaugeSegment('LowExtreme', 10, 1),
      new GaugeSegment('Low', 25, 2),
      new GaugeSegment('Acceptable', 100, 3),
      new GaugeSegment('High', 25, 2),
      new GaugeSegment('HighExtreme', 10, 1),
    ];

    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        colorFn: (GaugeSegment segment, _) =>
          segment.colorCode == 1 ? charts.MaterialPalette.red.shadeDefault : (segment.colorCode == 2 ? charts.MaterialPalette.yellow.shadeDefault : charts.MaterialPalette.green.shadeDefault),
        data: data,
      )
    ];
  }
}

class GaugeSegment {
  final String segment;
  final int size;
  final int colorCode;

  GaugeSegment(this.segment, this.size, this.colorCode);
}

class GaugeIndicator extends StatelessWidget {
  GaugeIndicator({
    this.size = 300.0,
    this.inputValue = 0.0,
  });
  final double size;
  final double inputValue;
  @override
  Widget build(BuildContext context) {
    return Stack( 
      alignment: Alignment.center,
      children: <Widget>[
        GaugeChart.withSampleData(),
        Indicator(size: size, indicatorColor: Colors.black, inputValue: inputValue),
      ]
    );
  }
}