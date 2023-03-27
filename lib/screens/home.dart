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
      body: SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor.primary),
                  onPressed: () {
                    setState(() {
                      _period = 'week';
                      _data = _generateData();
                    });
                  },
                  child: const Text('Week'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor.primary),
                  onPressed: () {
                    setState(() {
                      _period = 'month';
                      _data = _generateData();
                    });
                  },
                  child: const Text('Month'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor.primary),
                  onPressed: () {
                    setState(() {
                      _period = 'year';
                      _data = _generateData();
                    });
                  },
                  child: const Text('Year'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Expanded(
                child: SfCartesianChart(
                  backgroundColor: themeColor.white.first,
                  primaryXAxis: DateTimeAxis(),
                  series: <ChartSeries<Data, DateTime>>[
                    LineSeries<Data, DateTime>(
                      dataSource: _data,
                      xValueMapper: (Data data, _) => data.date,
                      yValueMapper: (Data data, _) => data.value,
                    ),
                  ],
                  primaryYAxis: NumericAxis(minimum: yAxisMin, maximum: yAxisMax),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

// グラフに表示するデータのクラス
class Data {
  final DateTime date;
  final double value;

  Data(this.date, this.value);
}
