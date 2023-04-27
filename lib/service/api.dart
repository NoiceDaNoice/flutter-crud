import 'dart:convert';

import 'package:flutter_app_testing/constant/string.dart';
import 'package:flutter_app_testing/model/user_model.dart';

import 'package:http/http.dart' as http;

class Api {
  Future<List<UserModel>> getAllUser() async {
    final response = await http.get(
      Uri.parse(StringConstant.endpoint),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode.toString() + ' get all user');
    return userModelFromJson(response.body);
  }

  Future<int> addUser({required String name, required String job}) async {
    Map data = {"name": name, "job": job};
    final response = await http.post(
      Uri.parse(StringConstant.endpoint),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body);
    print(response.statusCode.toString() + ' add user');
    return response.statusCode;
  }

  Future<int> updateUser(
      {required String name, required String job, required String id}) async {
    Map data = {"name": name, "job": job};
    final response = await http.put(
      Uri.parse('${StringConstant.endpoint}/$id'),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode.toString() + ' update user');
    return response.statusCode;
  }

  Future<int> deteleUser({required String id}) async {
    final response = await http.delete(
      Uri.parse('${StringConstant.endpoint}/$id'),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode.toString() + ' delete user');
    return response.statusCode;
  }
}
