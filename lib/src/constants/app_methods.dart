import 'dart:math';

import 'package:cinema_plus/src/constants/app_enums.dart';

String getGender(int code) {
  switch (code) {
    case 0:
      return 'Not set / not specified';
    case 1:
      return 'Female';
    case 2:
      return 'Male';
    case 3:
      return 'Non-binary';
    default:
      return 'Not set / not specified';
  }
}

String generateUserID() {
  const charList =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
  String genUID = "";
  for (var i = 0; i < 6; i++) {
    genUID += charList[Random().nextInt(charList.length - 1)];
  }
  return genUID;
}

String getGenre(int id) {
  final genre = genres.where((obj) => obj["id"] == id).first;
  return genre['name'] as String;
}

String getTagline(List<int> ids) {
  String tagLines = "";
  for (var i = 0; i < ids.length; i++) {
    if (i == ids.length - 1) {
      tagLines += getGenre(ids[i]);
    }
    tagLines += '${getGenre(ids[i])}, ';
  }
  return tagLines.trim();
}

getAvailableDays() {
  List<DateTime> dateList = [];
  final today = DateTime.now();
  for (var i = 0; i < 31; i++) {
    final newDay = today.add(Duration(days: i));
    dateList.add(newDay);
  }
  return dateList;
}
