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
    String? hall,
    required List<String> seats,
    DateTime? dateTime,
  }) = _Cinema;

  factory Cinema.fromJson(Map<String, dynamic> json) => _$CinemaFromJson(json);

  factory Cinema.empty() => Cinema(
        name: '',
        image: '',
        popularity: 0,
        location: '',
        hall: null,
        seats: [],
        dateTime: null,
      );
}
