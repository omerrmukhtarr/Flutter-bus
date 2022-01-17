import 'package:cloud_firestore/cloud_firestore.dart';

class GeneralUser {
  String? chat;
  Timestamp? date; // the uid from firebase auth service

  GeneralUser({this.chat, this.date});

  // from map which reads the data from the database

  factory GeneralUser.fromMap(Map<String, dynamic> json) =>
      GeneralUser(chat: json["chat"], date: json["Time"]);

  // toMap()
  Map<String, dynamic> toMap() => {
        "chat": chat,
        "Time": date,
      };
}
