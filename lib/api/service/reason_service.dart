import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ReasonService {
  final String BASE_URL = "https://gdsc-utokyo-rxy2w4nxya-uc.a.run.app";
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
    HttpClient client = HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    final http = IOClient(client);

    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
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
    HttpClient client = HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    final http = IOClient(client);

    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = {'reason': reason};

    final response = await http.post(
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
    HttpClient client = HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    final http = IOClient(client);

    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl/$id';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = {'reason': reason};

    final response = await http.put(
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
    HttpClient client = HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    final http = IOClient(client);

    String token = await getToken();

    var finalUrl = '$BASE_URL$endUrl/$id';
    var headers = {
      'Content-type' : 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.delete(
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
