import 'dart:math';

import 'package:cinema_plus/src/constants/app_enums.dart';
import 'package:cinema_plus/src/style/style.dart';

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

List<DateTime> getAvailableDays() {
  List<DateTime> dateList = [];
  final today = DateTime.now();
  for (var i = 0; i < 31; i++) {
    final newDay = today.add(Duration(days: i));
    dateList.add(newDay);
  }
  return dateList;
}

getCinemaSeatState(CinemaSeatState state){
  
}

CPColor getChairColor(CinemaSeatState state) {
  switch (state) {
    case CinemaSeatState.available:
      return CPColors.grey100;
    case CinemaSeatState.booked:
      return CPColors.grey700;
    case CinemaSeatState.selected:
      return CPColors.pink;
    default:
      return CPColors.grey100;
  }
}