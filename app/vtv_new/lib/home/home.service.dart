import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtv_new/common/auth_token.model.dart';
import 'package:vtv_new/home/home.model.dart';
import '../environments.dart';

class HomeService {
  const HomeService();

  Future<dynamic> get_new_service(String access_token) async {
    String url = 'international/get-list/';

    final response = await http.get(Uri.parse(BASE_URL + url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $access_token',
    }
    );

    if (response.statusCode == 200) {
      List<VTVNew> list_new = [];

      list_new = (jsonDecode(response.body) as List).map((i) => VTVNew.fromJson(i)).toList();
      return list_new;
    } else {
      throw Exception('Failed to get News');
    }
  }
}