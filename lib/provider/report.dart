import 'package:flutter/cupertino.dart';

class Report {
  String id;
  String date;
  int point;
  List<String> reasonIdList;

  Report(this.id, this.date, this.point, this.reasonIdList);
}

bool hasSameReportId(String reportId, List<Report> reasons) {
  bool hasSameId = false;
  for (var e in reasons) {
    if (e.id == reportId) {
      hasSameId = true;
    }
  }
  return hasSameId;
}

class ReportsProvider extends ChangeNotifier {
  final List<Report> _reports = [];

  List<Report> get reports => _reports;

  void create(Report report) {
    if (!hasSameReportId(report.id, _reports)) {
      _reports.add(report);
      _reports.sort((a,b) => a.date.compareTo(b.date));
      notifyListeners();
    }
  }

  void edit(Report report) {
    _reports.removeWhere((currentReport) => currentReport.id == report.id);
    _reports.add(report);
    _reports.sort((a,b) => a.date.compareTo(b.date));
    notifyListeners();
  }
}

class CurrentReportProvider extends ChangeNotifier {
  final Report _report = Report("", "", 0, []);

  Report get report => _report;

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

  void updateAll(Report report) {
    _report.id = report.id;
    _report.date = report.date;
    _report.point = report.point;
    _report.reasonIdList = report.reasonIdList;
    notifyListeners();
  }
}