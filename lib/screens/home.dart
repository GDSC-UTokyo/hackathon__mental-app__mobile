import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
import 'package:app/components/footer.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _period = 'week';
  List<Data> _data = [];

  @override
  void initState() {
    super.initState();
    _data = _generateData();
  }

  List<Data> _generateData() {
    final now = DateTime.now();
    List<Data> data = [];

    switch (_period) {
      case 'week':
        for (int i = 6; i >= 0; i--) {
          final date = now.subtract(Duration(days: i));
          final value = Random().nextInt(100).toDouble();
          data.add(Data(date, value));
        }
        break;
      case 'month':
        for (int i = 29; i >= 0; i--) {
          final date = now.subtract(Duration(days: i));
          final value = Random().nextInt(100).toDouble();
          data.add(Data(date, value));
        }
        break;
      case 'year':
        for (int i = 365; i >= 0; i--) {
          final date = now.subtract(Duration(days: i));
          final value = Random().nextInt(100).toDouble();
          data.add(Data(date, value));
        }
        break;
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    const double yAxisMin = 0;
    const double yAxisMax = 100;
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: themeColor.primary,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Mental Point',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5E5E5E)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Avg',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5E5E5E)),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    '57',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5E5E5E)),
                  ),
                  Spacer(
                    flex: 7,
                  ),
                ],
              ),
            ),
            Align(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: themeColor.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: const BoxConstraints(maxWidth: 290),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: _period == "week"
                            ? themeColor.paleBlue
                            : themeColor.background,
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          _period = 'week';
                          _data = _generateData();
                        });
                      },
                      child: const Text(
                        'Week',
                        style: TextStyle(
                            color: Color(0xff5E5E5E),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: _period == "month"
                              ? themeColor.paleBlue
                              : themeColor.background,
                          minimumSize: const Size(100, 50)),
                      onPressed: () {
                        setState(() {
                          _period = 'month';
                          _data = _generateData();
                        });
                      },
                      child: const Text(
                        'Month',
                        style: TextStyle(
                            color: Color(0xff5E5E5E),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: _period == "year"
                              ? themeColor.paleBlue
                              : themeColor.background,
                          minimumSize: const Size(100, 50)),
                      onPressed: () {
                        setState(() {
                          _period = 'year';
                          _data = _generateData();
                        });
                      },
                      child: const Text(
                        'Year',
                        style: TextStyle(
                            color: Color(0xff5E5E5E),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SfCartesianChart(
                backgroundColor: Colors.white,
                primaryXAxis: DateTimeAxis(
                  labelStyle: TextStyle(
                      color: themeColor.grey[4], fontWeight: FontWeight.bold),
                  axisLine: AxisLine(color: themeColor.grey[4]),
                  plotBands: <PlotBand>[
                    PlotBand(
                      isVisible: true,
                      start: _data[0].date,
                      end: _data[0].date,
                      color: Colors.blue,
                    )
                  ],
                  majorGridLines:
                      const MajorGridLines(color: Colors.transparent),
                  majorTickLines: MajorTickLines(color: themeColor.grey[4]),
                ),
                primaryYAxis: NumericAxis(
                    axisLine: AxisLine(color: themeColor.grey[4], width: 1),
                    minimum: yAxisMin,
                    maximum: yAxisMax,
                    labelStyle: TextStyle(
                        color: themeColor.grey[4], fontWeight: FontWeight.bold),
                    plotBands: <PlotBand>[
                      PlotBand(
                        start: 20,
                        end: 40,
                        color: const Color(0x00FAF7F0),
                      ),
                      PlotBand(
                          start: 60, end: 80, color: const Color(0x00FAF7F0))
                    ],
                    majorGridLines:
                        const MajorGridLines(color: Colors.transparent),
                    majorTickLines: MajorTickLines(color: themeColor.grey[4])),
                series: <ChartSeries<Data, DateTime>>[
                  LineSeries<Data, DateTime>(
                    color: themeColor.secondary,
                    dataSource: _data,
                    xValueMapper: (Data data, _) => data.date,
                    yValueMapper: (Data data, _) => data.value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

// グラフに表示するデータのクラス
class Data {
  final DateTime date;
  final double value;

  Data(this.date, this.value);
}
