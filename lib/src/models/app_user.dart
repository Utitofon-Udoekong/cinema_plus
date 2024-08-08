import 'package:cinema_plus/src/models/movie/movie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser(
      {
      required String uid,
      required String userId,
      required String email,
      required List<Movie>? favourites
      }
    ) = _AppUser;

  factory AppUser.empty() => const AppUser(uid: '', userId: '', email: '', favourites: null);

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic> docdata = doc.data() as Map<String, dynamic>? ??
        AppUser.empty().toJson();

    return AppUser.fromJson(docdata);
  }

}
