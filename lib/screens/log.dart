import 'dart:convert';

import 'package:app/api/service/report_service.dart';
import 'package:app/provider/reason.dart';
import 'package:app/provider/report.dart';
import 'package:app/provider/currentReport.dart';
import 'package:app/screens/create_report.dart';
import 'package:app/screens/edit_report.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../api/entity/reason/reason_entity.dart';
import '../api/entity/reportDetail/report_detail_entity.dart';
import '../api/service/reason_service.dart';
import 'home.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  _LogPageState createState() => _LogPageState();
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

  Future<void> initializeAsync() async {
    final reportsResponse = await ReportService().fetchList("", "", 10);
    List<Map<String, dynamic>> decodedReportsResponse = jsonDecode(reportsResponse.body).cast<Map<String, dynamic>>();
    if (!mounted) return;
    for (var jsonMap in decodedReportsResponse) {
      context.read<ReportsProvider>().create(Report(
        jsonMap['mentalPointId'].toString(),
        jsonMap['createDate'].toString(),
        int.parse(jsonMap['point'].toString()),
        List<String>.from(jsonMap['reasonIdList'])
      ));
    }

    final reasonsResponse = await ReasonService().fetch();
    List<Map<String, dynamic>> decodedReasonsResponse = jsonDecode(reasonsResponse.body).cast<Map<String, dynamic>>();
    if (!mounted) return;
    for (var jsonMap in decodedReasonsResponse) {
      context.read<ReasonsProvider>().create(Reason(
        jsonMap['id'].toString(),
        jsonMap['reason'].toString(),
      ));
    }
  }

  @override
  void initState() {
    super.initState();

    initializeAsync();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;
    List<Reason> reasonList = context.watch<ReasonsProvider>().reasons;
    List<Report> reports = context.watch<ReportsProvider>().reports;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Log'),
        backgroundColor: themeColor.primary,
        automaticallyImplyLeading: false,
      ),
      body: reports.isNotEmpty
        ? ListView.builder(
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
                          context.read<CurrentReportProvider>().updateMode(false),
                          context.read<CurrentReportProvider>().updateReport(reports[index]),
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const EditReportPage();
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
                                return Visibility(
                                  visible: convertIdToReason(id, reasonList).isNotEmpty,
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(32)
                                        ),
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
                                  )
                                );
                              }).toList(),
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
            );
          },
        )
        : const Center(
          child: Text(
            "no report",
            style: TextStyle(fontSize: 32, color: Colors.grey),
          ),
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
            context.read<CurrentReportProvider>().updateMode(true);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const CreateReportPage();
              }),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu),
            label: 'log',
          ),
        ],
        selectedItemColor: themeColor.grey[0],
        unselectedItemColor: themeColor.primary,
        showUnselectedLabels: true,
        onTap: (int value) {
          if (value == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                }
              )
            );
          }
        },
      ),
    );
  }
}
