// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel extends Equatable {
  const UserModel({
    this.id,
    this.name,
    this.job,
  });

  final String? id;
  final String? name;
  final String? job;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "job": job,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, job];
}
