// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class CreditCard {
  final String id;
  final String cardName;
  final String cardNumber;
  final String expDate;
  final String cvv;

  CreditCard({
    required this.id,
    required this.cardName,
    required this.cardNumber,
    required this.expDate,
    required this.cvv,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cardName': cardName,
      'cardNumber': cardNumber,
      'expDate': expDate,
      'cvv': cvv,
    };
  }

  factory CreditCard.empty() => CreditCard(
        id: '',
        cardName: '',
        cardNumber: '',
        expDate: '',
        cvv: '',
      );

  factory CreditCard.fromJson(Map<String, dynamic> map) {
    return CreditCard(
      id: map['id'] as String,
      cardName: map['cardName'] as String,
      cardNumber: map['cardNumber'] as String,
      expDate: map['expDate'] as String,
      cvv: map['cvv'] as String,
    );
  }

  factory CreditCard.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return CreditCard(
      id: data['id'] as String,
      cardName: data['cardName'] as String,
      cardNumber: data['cardNumber'] as String,
      expDate: data['expDate'] as String,
      cvv: data['cvv'] as String,
    );
  }

  static Map<String, dynamic> toFirestore(CreditCard creditCard) {
    return {
      'id': creditCard.id,
      'cardName': creditCard.cardName,
      'cardNumber': creditCard.cardNumber,
      'expDate': creditCard.expDate,
      'cvv': creditCard.cvv,
    };
  }

  CreditCard copyWith({
    String? id,
    String? cardName,
    String? cardNumber,
    String? expDate,
    String? cvv,
  }) {
    return CreditCard(
      id: id ?? this.id,
      cardName: cardName ?? this.cardName,
      cardNumber: cardNumber ?? this.cardNumber,
      expDate: expDate ?? this.expDate,
      cvv: cvv ?? this.cvv,
    );
  }
}
