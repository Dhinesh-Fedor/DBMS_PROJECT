// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dbms_project/constants/dbconstants.dart';
import 'package:dbms_project/models/bookticketmodel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, collection;
  static connect() async {
    db = await Db.create(DbConstants.mongodb_url);
    await db.open();
    collection = db.collection(DbConstants.collection_name);
  }

  static Future<String> insert(BookTicketsModel data) async {
    try {
      var result = await collection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "1";
      } else {
        return "0";
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> delete(BookTicketsModel data) async {
      await collection.remove(where.id(data.id));
  }

  static Future<List<Map<String, dynamic>>> retrieve() async {
    final data = await collection.find().toList();
    return data;
  }
}
