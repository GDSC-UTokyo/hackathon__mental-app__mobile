import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class ReportService {
  final String BASE_URL = "https://localhost:8080";
  final String endUrl = '/reports';

  Future<String> getToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String token = await user.getIdToken();
      return token;
    } else {
      throw Exception('user not found');
    }
  }

  Future<http.Response> fetchDetail(String id) async {
    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl/$id';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };

    final http.Response response = await http.get(
      Uri.parse(finalUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<http.Response> fetchList(String createdDate, String endDate, int count) async {
    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = {
      'createdDate': createdDate,
      'endDate': endDate,
      'count': count
    };

    final http.Response response = await http.post(
      Uri.parse(finalUrl),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<http.Response> create(String createdDate, int point, List<String> reasonIdList) async {
    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = {
      'createdDate': createdDate,
      'point': point,
      'reasonIdList': reasonIdList
    };

    final http.Response response = await http.post(
      Uri.parse(finalUrl),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<http.Response> update(String id, int point, List<String> reasonIdList) async {
    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl/$id';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = {
      'point': point,
      'reasonIdList': reasonIdList
    };

    final http.Response response = await http.put(
      Uri.parse(finalUrl),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }
}