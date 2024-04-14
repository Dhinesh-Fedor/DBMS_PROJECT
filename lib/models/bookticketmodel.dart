import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

class BookTicketsModel {
    final ObjectId id;
    final String firstname;
    final String lastname;
    final String age;
    final String gender;
    final String from;
    final String destination;

    BookTicketsModel({
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.age,
        required this.gender,
        required this.from,
        required this.destination,
    });

    factory BookTicketsModel.fromRawJson(String str) => BookTicketsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookTicketsModel.fromJson(Map<String, dynamic> json) => BookTicketsModel(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        gender: json["gender"],
        from: json["from"],
        destination: json["destination"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "gender": gender,
        "from": from,
        "destination": destination,
    };
}