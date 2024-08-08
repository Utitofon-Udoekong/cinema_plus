import 'dart:math';

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
