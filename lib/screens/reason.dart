import 'package:app/screens/create_reason.dart';
import 'package:app/screens/edit_reason.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:app/provider/reason.dart';

class ReasonPage extends StatefulWidget {
  const ReasonPage({super.key});

  @override
  _ReasonPageState createState() => _ReasonPageState();
}

class _ReasonPageState extends State<ReasonPage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeProvider>(context).theme.colorTheme;
    List<Reason> reasonList = context.watch<ReasonsProvider>().reasons;

    return Scaffold(
      backgroundColor: themeColor.background,
      appBar: AppBar(
        title: const Text('Reason'),
        backgroundColor: themeColor.primary,
      ),
      body: reasonList.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: ListView.builder(
            itemCount: reasonList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reasonList[index].reason,
                      style: const TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.green,
                          onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return const EditReasonPage();
                              }),
                            ),
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => {
                            context.read<ReasonsProvider>().delete(reasonList[index].id)
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          )
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
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const CreateReasonPage();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
