import 'dart:convert';

import 'package:app/provider/reason.dart';
import 'package:app/provider/report.dart';
import 'package:app/provider/currentReport.dart';
import 'package:app/screens/log.dart';
import 'package:app/screens/reason.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/theme/theme.dart';

import '../api/entity/report/report_entity.dart';
import '../api/service/report_service.dart';

class EditReportPage extends StatefulWidget {
  const EditReportPage({super.key});

  @override
  _EditReportPageState createState() => _EditReportPageState();
}

class _EditReportPageState extends State<EditReportPage> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;
    final currentReport = context.watch<CurrentReportProvider>().report;
    final id = currentReport.id;
    final mentalPoint = currentReport.point.toDouble();
    final date = currentReport.date;
    final selectedIdList = currentReport.reasonIdList;
    final reasonList = context.watch<ReasonsProvider>().reasons;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Edit Report'),
        backgroundColor: themeColor.primary,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              date,
              style: const TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Mental Point',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              child: Text(
                mentalPoint.toInt().toString(),
                style: const TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              child: Slider(
                value: mentalPoint,
                onChanged: (value) {
                  context.read<CurrentReportProvider>().updatePoint(value.toInt());
                },
                min: 0.0,
                max: 100.0,
                divisions: 100,
                label: mentalPoint.toInt().toString(),
                activeColor: themeColor.primary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Reason',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_note),
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return const ReasonPage();
                          }
                      ),
                    )
                  },
                ),
              ],
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
                        children: reasonList.map((reason) {
                          final isSelected = selectedIdList.contains(reason.id);
                          return InkWell(
                            borderRadius: const BorderRadius.all(Radius.circular(32)),
                            onTap: () {
                              if (isSelected) {
                                context.read<CurrentReportProvider>().updateReasonIdList([...selectedIdList]..remove(reason.id));
                              } else {
                                context.read<CurrentReportProvider>().updateReasonIdList([...selectedIdList, reason.id]);
                              }
                              setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(32)),
                                border: Border.all(
                                  width: 2,
                                  color: themeColor.secondary,
                                ),
                                color: isSelected ? themeColor.secondary : null,
                              ),
                              child: Text(
                                reason.reason,
                                style: TextStyle(
                                  color: isSelected ? themeColor.white[0] : themeColor.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  )
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (selectedIdList.isNotEmpty) {
                        try {
                          final response = await ReportService().update(id, mentalPoint.toInt(), selectedIdList);

                          final data = ReportEntity.fromJson(json.decode(response.body));

                          if (!mounted) return;
                          context.read<CurrentReportProvider>().updateReport(
                              Report(data.mentalPointId, date, data.point, data.reasonIdList)
                          );
                          context.read<ReportsProvider>().edit(
                              Report(data.mentalPointId, date, data.point, data.reasonIdList)
                          );
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return const LogPage();
                              })
                          );
                        } catch(e) {
                          setState(() {
                            message = 'failed in updating report';
                          });
                        }
                      } else {
                        setState(() {
                          message = "Select at least one reason";
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor.primary,
                      foregroundColor: themeColor.white.first,
                      fixedSize: const Size(200, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: const Text('edit'),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
