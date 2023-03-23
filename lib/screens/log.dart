import 'package:app/screens/create_report.dart';
import 'package:app/screens/edit_report.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/components/footer.dart';
import 'package:intl/intl.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  _LogPageState createState() => _LogPageState();
}

class Report {
  String date;
  int point;
  List<String> reasonIdList;

  Report(this.date, this.point, this.reasonIdList);
}

class Reason {
  String id;
  String reason;

  Reason(this.id, this.reason);
}

String convertIdToReason(String id, List<Reason> reasonList) {
  String reason = "";
  for (int i = 0; i < reasonList.length; i++) {
    if (id == reasonList[i].id) {
      reason = reasonList[i].reason;
    }
  }
  return reason;
}

bool hasTodayReport(String date, List<Report> reports) {
  bool hasReport = false;
  for (int i = 0; i < reports.length; i++) {
    if (reports[i].date == date) {
      hasReport = true;
    }
  }
  return hasReport;
}

class _LogPageState extends State<LogPage> {
  List<Reason> reasonList = [
    Reason("1", "睡眠不足"),
    Reason("2", "恋愛"),
    Reason("3", "趣味"),
    Reason("4", "仕事"),
    Reason("5", "友達"),
  ];

  List<Report> reports = [
    Report("2023-03-18", 50, ["1", "2", "4"]),
    Report("2023-03-19", 60, ["2", "3", "4"]),
    Report("2023-03-20", 70, ["1", "2", "4"]),
    Report("2023-03-20", 70, ["1", "2", "4"]),
    Report("2023-03-20", 70, ["1", "2", "4"]),
    Report("2023-03-20", 70, ["1", "2", "4"]),
    Report("2023-03-20", 70, ["1", "2", "4"]),
    Report("2023-03-20", 70, ["1", "2", "4"]),
    Report("2023-03-20", 70, ["1", "2", "4"]),
    Report("2023-03-22", 70, ["1", "2", "4"]),
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
                            return EditReportPage(
                              date: reports[index].date,
                              point: reports[index].point.toString(),
                              reasonIdList: reports[index].reasonIdList.join(','),
                            );
                          })
                        ),
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: const Alignment(-0.8, 0),
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
                  alignment: const Alignment(-0.8, 0),
                  child: const Text(
                    'Reason',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Wrap(
                            runSpacing: 16,
                            spacing: 16,
                            children: reports[index].reasonIdList.map((id) {
                              return InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(32)),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(32)),
                                    border: Border.all(
                                      width: 2,
                                      color: themeColor.secondary,
                                    ),
                                    color: themeColor.secondary,
                                  ),
                                  child: Text(
                                    convertIdToReason(id, reasonList),
                                    style: TextStyle(
                                      color: themeColor.white[0],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      )),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor.primary,
        onPressed: () {
          DateTime now = DateTime.now();
          DateFormat outputFormat = DateFormat('yyyy-MM-dd');
          String date = outputFormat.format(now);
          if (hasTodayReport(date, reports)) {
            return;
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const CreateReportPage();
              }),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
