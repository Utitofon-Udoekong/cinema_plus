import 'dart:math';

import 'package:cinema_plus/src/models/cinema.dart';
import 'package:cinema_plus/src/models/models.dart';

final cinemaList = <Cinema>[
  Cinema(
    name: 'Cinémathèque québécoise',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Cinematheque_quebecoise.JPG/100px-Cinematheque_quebecoise.JPG',
    popularity: 4.7,
    location: '1564 Saint Denis St, Montreal, QC, Canada',
    seats: generateSeats(),
  ),
  Cinema(
    name: 'Corona Theatre',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Theatre_Corona_02.JPG/100px-Theatre_Corona_02.JPG',
    popularity: 3.5,
    location: 'FCMF+6VH Montreal, Quebec, Canada',
    seats: generateSeats(),
  ),
  Cinema(
    name: 'Garneau Theatre',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Garneau_Theater_1.jpg/100px-Garneau_Theater_1.jpg',
    popularity: 4,
    location: 'GFFQ+65Q Edmonton, Alberta, Canada',
    seats: generateSeats(),
  ),
  Cinema(
    name: 'L\'Arlequin',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/L%27Arlequin.JPG/100px-L%27Arlequin.JPG',
    popularity: 4.3,
    location: 'Luxembourg, 75006 Paris, France',
    seats: generateSeats(),
  ),
  Cinema(
    name: 'Le Grand Rex',
    image:
        'https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/Legrandrexfacade.jpg/100px-Legrandrexfacade.jpg',
    popularity: 3.7,
    location: '1 Bd Poissonnière, 75002 Paris, France',
    seats: generateSeats(),
  ),
  Cinema(
    name: 'Tennispalatsi',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Tennispalatsi_Helsinki.jpg/100px-Tennispalatsi_Helsinki.jpg',
    popularity: 4.7,
    location: 'Tennispalatsi, 00100 Helsinki, Finland',
    seats: generateSeats(),
  ),
  Cinema(
    name: 'Teatro Adriano',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Prati_-_teatro_Adriano_1040957.JPG/100px-Prati_-_teatro_Adriano_1040957.JPG',
    popularity: 4.7,
    location: 'Piazza Cavour, 7, 00193 Roma RM, Italy',
    seats: generateSeats(),
  ),
  Cinema(
    name: 'London IMAX',
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/London_IMAX_cinema_2.jpg/100px-London_IMAX_cinema_2.jpg',
    popularity: 4.8,
    location: 'Lambeth, London SE1 8XR, UK',
    seats: generateSeats(),
  ),
];

List<String> generateSeats() {
  List<String> seats = [];
  String columns = "12345678";
  String rows = "ABCDEFGH";
  for (var i = 0; i < Random().nextInt(50) + 10; i++) {
    final randomColumnIndex = Random().nextInt(columns.length - 1);
    final randomRowIndex = Random().nextInt(rows.length - 1);
    final randomRow = rows[randomRowIndex];
    final randomColumn = columns[randomColumnIndex];
    bool failCase1 =
        randomColumn == '1' && (randomRow == 'A' || randomRow == 'B');
    bool failCase2 =
        randomColumn == '2' && (randomRow == 'A' || randomRow == 'B');

    if (failCase1 || failCase2) {
      continue;
    } else {
      String seat = '$randomRow$randomColumn';
      seats.add(seat);
    }
  }
  return seats;
}
