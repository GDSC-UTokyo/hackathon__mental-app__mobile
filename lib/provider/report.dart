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

class ReportProvider extends ChangeNotifier {
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
