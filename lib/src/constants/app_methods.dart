import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_plus/src/constants/app_enums.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';

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
    } else {
      tagLines += '${getGenre(ids[i])}, ';
    }
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

CPColor getChairColor(CinemaSeatState state, BuildContext context) {
  final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
  switch (state) {
    case CinemaSeatState.available:
      return isDark ? CPColors.grey300 : CPColors.grey500;
    case CinemaSeatState.booked:
      return isDark ? CPColors.grey500 : CPColors.grey300;
    case CinemaSeatState.selected:
      return CPColors.pink;
    default:
      return CPColors.grey500;
  }
}

double generateTicketPrice() {
  final randomDouble = Random().nextDouble() * 3;
  return (Random().nextInt(45) + 5) + randomDouble;
}

String generateDocId() {
  const charList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  String genUID = "";
  for (var i = 0; i < 8; i++) {
    genUID += charList[Random().nextInt(charList.length - 1)];
  }
  return genUID;
}

List<String> generateSeats() {
  List<String> seats = [];
  String columns = "12345678";
  String rows = "ABCDEFGH";
  int seatLength = Random().nextInt(50) + 30;
  for (var i = 0; i < seatLength; i++) {
    final randomColumnIndex = Random().nextInt(columns.length - 1);
    final randomRowIndex = Random().nextInt(rows.length - 1);
    final randomRow = rows[randomRowIndex];
    final randomColumn = columns[randomColumnIndex];
    String seat = '$randomRow$randomColumn';
    seats.add(seat);
  }
  return seats;
}

String generateHall() {
  String columns = "12345678";
  String rows = "ABCDEFGH";
  final randomColumnIndex = Random().nextInt(columns.length - 1);
  final randomRowIndex = Random().nextInt(rows.length - 1);
  final randomRow = rows[randomRowIndex];
  final randomColumn = columns[randomColumnIndex];
  return '$randomRow$randomColumn';
}

String getViewingSession(String time) {
  const _classicSession = [
    "17:15",
    "19:00",
    "20:45",
    "21:50",
    "23:05",
  ];
  if (_classicSession.contains(time)) {
    return "CLASSIC SESSION";
  } else {
    return '3D SESSION';
  }
}
