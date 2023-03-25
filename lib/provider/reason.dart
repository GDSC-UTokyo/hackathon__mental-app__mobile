import 'package:flutter/cupertino.dart';

class Reason {
  String id;
  String reason;

  Reason(this.id, this.reason);
}

bool hasSameReasonId(String reasonId, List<Reason> reasons) {
  bool hasSameId = false;
  for (var e in reasons) {
    if (e.id == reasonId) {
      hasSameId = true;
    }
  }
  return hasSameId;
}

class ReasonProvider extends ChangeNotifier {
  final List<Reason> _reasons = [];

  List<Reason> get reasons => _reasons;

  void create(Reason reason) {
    if (!hasSameReasonId(reason.id, _reasons)) {
      _reasons.add(reason);
      notifyListeners();
    }
  }

  void edit(Reason reason) {
    _reasons.removeWhere((currentReason) => currentReason.id == reason.id);
    _reasons.add(reason);
    notifyListeners();
  }

  void delete(String id) {
    _reasons.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
