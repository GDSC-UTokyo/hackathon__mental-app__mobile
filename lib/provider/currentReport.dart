import 'package:flutter/cupertino.dart';
import './report.dart';

class CurrentReport {
  String id;
  String date;
  int point;
  List<String> reasonIdList;
  bool isCreateMode;

  CurrentReport(this.id, this.date, this.point, this.reasonIdList, this.isCreateMode);
}

class CurrentReportProvider extends ChangeNotifier {
  final CurrentReport _report = CurrentReport("", "", 0, [], true);

  CurrentReport get report => _report;

  void updateId(String id) {
    _report.id = id;
    notifyListeners();
  }

  void updateDate(String date) {
    _report.date = date;
    notifyListeners();
  }

  void updatePoint(int point) {
    _report.point = point;
    notifyListeners();
  }

  void updateReasonIdList(List<String> reasonIdList) {
    _report.reasonIdList = reasonIdList;
    notifyListeners();
  }

  void updateMode(bool isCreateMode) {
    _report.isCreateMode = isCreateMode;
    notifyListeners();
  }

  void updateReport(Report report) {
    _report.id = report.id;
    _report.date = report.date;
    _report.point = report.point;
    _report.reasonIdList = report.reasonIdList;
    notifyListeners();
  }
}