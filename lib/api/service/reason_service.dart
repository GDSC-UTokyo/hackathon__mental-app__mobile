import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class ReasonService {
  final String BASE_URL = "https://localhost:8080";
  final String endUrl = '/reasons';

  Future<String> getToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String token = await user.getIdToken();
      return token;
    } else {
      throw Exception('user not found');
    }
  }

  Future<http.Response> fetch() async {
    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl';
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

  Future<http.Response> create(String reason) async {
    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = {'reason': reason};

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

  Future<http.Response> update(String id, String reason) async {
    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl/$id';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = {'reason': reason};

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

  Future<http.Response> delete(String id) async {
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
}
