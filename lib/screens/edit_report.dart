import 'package:app/screens/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/theme/theme.dart';

class EditReportPage extends StatefulWidget {
  final String date;
  final String point;
  final String reasonIdList;
  const EditReportPage(
      {super.key,
      required this.date,
      required this.point,
      required this.reasonIdList});

  @override
  _EditReportPageState createState() => _EditReportPageState();
}

class _EditReportPageState extends State<EditReportPage> {
  double mentalPoint = 50.0;
  List<Reason> reasonList = [
    Reason("1", "睡眠不足"),
    Reason("2", "恋愛"),
    Reason("3", "趣味"),
    Reason("4", "仕事"),
    Reason("5", "友達"),
  ];
  var selectedIdList = <String>[];

  @override
  void initState() {
    super.initState();

   mentalPoint = int.parse(widget.point).toDouble();
   selectedIdList = widget.reasonIdList.split(',');
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;
    final date = widget.date;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Edit Report'),
        backgroundColor: themeColor.primary,
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
            Text(
              date,
              style: const TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
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
                mentalPoint.toInt().toString(),
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
                value: mentalPoint,
                onChanged: (value) {
                  setState(() {
                    mentalPoint = value;
                  });
                },
                min: 0.0,
                max: 100.0,
                divisions: 100,
                label: mentalPoint.toInt().toString(),
                activeColor: themeColor.primary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.only(
                top: 0,
              ),
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
                        children: reasonList.map((reason) {
                          final isSelected = selectedIdList.contains(reason.id);
                          return InkWell(
                            borderRadius: const BorderRadius.all(Radius.circular(32)),
                            onTap: () {
                              if (isSelected) {
                                selectedIdList.remove(reason.id);
                              } else {
                                selectedIdList.add(reason.id);
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
                    top: 30,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
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
