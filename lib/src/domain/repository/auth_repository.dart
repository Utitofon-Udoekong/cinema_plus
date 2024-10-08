import 'package:cache/cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:cinema_plus/src/constants/app_methods.dart';
import 'package:cinema_plus/src/core/firebase_helpers.dart';
import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:cinema_plus/src/models/models.dart' show AppUser;

@lazySingleton
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository(this._cache, this._firebaseAuth, 
      this._firebaseFirestore);

  final CacheClient _cache;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [AppUser] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [AppUser.empty()] if the user is not authenticated.
  Stream<AppUser> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? AppUser.empty() : firebaseUser.toDomain();
      return user;
    });
  }

  Stream<AppUser> firestoreChanges({required String uid}) {
    final Stream<DocumentSnapshot> snapshots =
        _firebaseFirestore.userCollection.doc(uid).snapshots();

    return snapshots.map((e) {
      //Sometimes the stream may emit a doc with a null data when a user signs
      //out. This causes an exception when paring the user's document's data.
      if (e.data() == null) {
        return AppUser.empty();
      }

      final user = AppUser.fromFirestore(e);
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [AppUser.empty] if there is no cached user.
  AppUser get currentUser {
    return _cache.read<AppUser>(key: userCacheKey) ?? AppUser.empty();
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        _firebaseFirestore.doc("users/${value.user!.uid}").set({
          "email": email,
          "userId": generateUserID(),
          "uid": value.user!.uid
        });
      });
    } on FirebaseAuthException catch (e) {
      throw CPException.auth(e);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw CPException.auth(e);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<bool> logOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      throw CPException.auth(e);
    }
  }
}
