import 'dart:convert';

import 'package:bloc_api_practice/models/UserModel.dart';
import 'package:http/http.dart';

class UserApiService {
  final String _baseURL = 'https://jsonplaceholder.typicode.com';
  final String _apiURL = '/users';

  Future<List<UserModel>> fetchData() async {
    var response = await get(Uri.parse(_baseURL + _apiURL));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    }
    return [];
  }
}
