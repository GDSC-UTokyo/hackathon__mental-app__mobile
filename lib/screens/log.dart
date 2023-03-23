import 'package:app/screens/create_report.dart';
import 'package:app/screens/edit_report.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/components/footer.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  _LogPageState createState() => _LogPageState();
}

class Report {
  String date;
  int point;
  String reason; // reasonIdsを入れる

  Report(this.date, this.point, this.reason);
}

class _LogPageState extends State<LogPage> {
  List<Report> reports = [
    Report("2022-03-18",50,"sleepy"),
    Report("2022-03-19",60,"sleepy"),
    Report("2022-03-20",70,"sleepy"),
    Report("2022-03-20",70,"sleepy"),
    Report("2022-03-20",70,"sleepy"),
    Report("2022-03-20",70,"sleepy"),
    Report("2022-03-20",70,"sleepy"),
    Report("2022-03-20",70,"sleepy"),
    Report("2022-03-20",70,"sleepy"),
    Report("2022-03-20",70,"sleepy"),
  ];

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Log'),
        backgroundColor: themeColor.primary,
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reports[index].date,
                      style: const TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return EditReportPage();
                          }),
                        ),
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: const Alignment(-0.8,0),
                  child: const Text(
                    'Mental Point',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    reports[index].point.toString(),
                    style: const TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  child: Slider(
                    value: reports[index].point.toDouble(),
                    onChanged: null,
                    min: 0.0,
                    max: 100.0,
                    divisions: 10,
                    activeColor: themeColor.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: const Alignment(-0.8,0),
                  child: const Text(
                    'Reason',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    reports[index].reason,
                    style: const TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor.primary,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return CreateReportPage();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
