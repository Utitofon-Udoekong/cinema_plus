import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cinema.freezed.dart';
part 'cinema.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@unfreezed
class Cinema with _$Cinema {
  factory Cinema({
    required String name,
    required String image,
    required double popularity,
    required String location,
    required String hall,
    required List<String> seats,
    DateTime? dateTime,
  }) = _Cinema;

  factory Cinema.fromJson(Map<String, dynamic> json) => _$CinemaFromJson(json);

  factory Cinema.empty() => Cinema(
        name: '',
        image: '',
        popularity: 0,
        location: '',
        hall: '',
        seats: [],
        dateTime: null,
      );
  
  factory Cinema.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Cinema(
      name: data['name'],
      image: data['image'],
      popularity: data['popularity'],
      location: data['location'],
      hall: data['hall'],
      seats: data['seats'],
      dateTime: data['dateTime']
    );
  }

  factory Cinema.fromFirestoreJson(
    Map<String, dynamic> data,
  ) {
    return Cinema(
      name: data['name'],
      image: data['image'],
      popularity: data['popularity'],
      location: data['location'],
      hall: data['hall'],
      seats: List<String>.from(data['seats']),
      dateTime: (data['dateTime'] as Timestamp).toDate()
    );
  }

  static Map<String, dynamic> toFirestore(Cinema cinema) {
    return {
      'name': cinema.name,
      'image': cinema.image,
      'popularity': cinema.popularity,
      'location': cinema.location,
      'hall': cinema.hall,
      'seats': cinema.seats,
      if (cinema.dateTime != null) 'dateTime': cinema.dateTime,
    };
  }

}
