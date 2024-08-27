// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentState {
  Ticket get selectedTicket => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;
  String get cardName => throw _privateConstructorUsedError;
  String get cardExpDate => throw _privateConstructorUsedError;
  String get cardCVV => throw _privateConstructorUsedError;
  String get failure => throw _privateConstructorUsedError;
  String get success => throw _privateConstructorUsedError;
  CreditCard get selectedCard => throw _privateConstructorUsedError;
  List<CreditCard> get creditCards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
  @useResult
  $Res call(
      {Ticket selectedTicket,
      bool isLoading,
      String cardNumber,
      String cardName,
      String cardExpDate,
      String cardCVV,
      String failure,
      String success,
      CreditCard selectedCard,
      List<CreditCard> creditCards});

  $TicketCopyWith<$Res> get selectedTicket;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTicket = null,
    Object? isLoading = null,
    Object? cardNumber = null,
    Object? cardName = null,
    Object? cardExpDate = null,
    Object? cardCVV = null,
    Object? failure = null,
    Object? success = null,
    Object? selectedCard = null,
    Object? creditCards = null,
  }) {
    return _then(_value.copyWith(
      selectedTicket: null == selectedTicket
          ? _value.selectedTicket
          : selectedTicket // ignore: cast_nullable_to_non_nullable
              as Ticket,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardName: null == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String,
      cardExpDate: null == cardExpDate
          ? _value.cardExpDate
          : cardExpDate // ignore: cast_nullable_to_non_nullable
              as String,
      cardCVV: null == cardCVV
          ? _value.cardCVV
          : cardCVV // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCard: null == selectedCard
          ? _value.selectedCard
          : selectedCard // ignore: cast_nullable_to_non_nullable
              as CreditCard,
      creditCards: null == creditCards
          ? _value.creditCards
          : creditCards // ignore: cast_nullable_to_non_nullable
              as List<CreditCard>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TicketCopyWith<$Res> get selectedTicket {
    return $TicketCopyWith<$Res>(_value.selectedTicket, (value) {
      return _then(_value.copyWith(selectedTicket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentStateImplCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$$PaymentStateImplCopyWith(
          _$PaymentStateImpl value, $Res Function(_$PaymentStateImpl) then) =
      __$$PaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Ticket selectedTicket,
      bool isLoading,
      String cardNumber,
      String cardName,
      String cardExpDate,
      String cardCVV,
      String failure,
      String success,
      CreditCard selectedCard,
      List<CreditCard> creditCards});

  @override
  $TicketCopyWith<$Res> get selectedTicket;
}

/// @nodoc
class __$$PaymentStateImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentStateImpl>
    implements _$$PaymentStateImplCopyWith<$Res> {
  __$$PaymentStateImplCopyWithImpl(
      _$PaymentStateImpl _value, $Res Function(_$PaymentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTicket = null,
    Object? isLoading = null,
    Object? cardNumber = null,
    Object? cardName = null,
    Object? cardExpDate = null,
    Object? cardCVV = null,
    Object? failure = null,
    Object? success = null,
    Object? selectedCard = null,
    Object? creditCards = null,
  }) {
    return _then(_$PaymentStateImpl(
      selectedTicket: null == selectedTicket
          ? _value.selectedTicket
          : selectedTicket // ignore: cast_nullable_to_non_nullable
              as Ticket,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardName: null == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String,
      cardExpDate: null == cardExpDate
          ? _value.cardExpDate
          : cardExpDate // ignore: cast_nullable_to_non_nullable
              as String,
      cardCVV: null == cardCVV
          ? _value.cardCVV
          : cardCVV // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCard: null == selectedCard
          ? _value.selectedCard
          : selectedCard // ignore: cast_nullable_to_non_nullable
              as CreditCard,
      creditCards: null == creditCards
          ? _value._creditCards
          : creditCards // ignore: cast_nullable_to_non_nullable
              as List<CreditCard>,
    ));
  }
}

/// @nodoc

class _$PaymentStateImpl implements _PaymentState {
  const _$PaymentStateImpl(
      {required this.selectedTicket,
      required this.isLoading,
      required this.cardNumber,
      required this.cardName,
      required this.cardExpDate,
      required this.cardCVV,
      required this.failure,
      required this.success,
      required this.selectedCard,
      required final List<CreditCard> creditCards})
      : _creditCards = creditCards;

  @override
  final Ticket selectedTicket;
  @override
  final bool isLoading;
  @override
  final String cardNumber;
  @override
  final String cardName;
  @override
  final String cardExpDate;
  @override
  final String cardCVV;
  @override
  final String failure;
  @override
  final String success;
  @override
  final CreditCard selectedCard;
  final List<CreditCard> _creditCards;
  @override
  List<CreditCard> get creditCards {
    if (_creditCards is EqualUnmodifiableListView) return _creditCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creditCards);
  }

  @override
  String toString() {
    return 'PaymentState(selectedTicket: $selectedTicket, isLoading: $isLoading, cardNumber: $cardNumber, cardName: $cardName, cardExpDate: $cardExpDate, cardCVV: $cardCVV, failure: $failure, success: $success, selectedCard: $selectedCard, creditCards: $creditCards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStateImpl &&
            (identical(other.selectedTicket, selectedTicket) ||
                other.selectedTicket == selectedTicket) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.cardName, cardName) ||
                other.cardName == cardName) &&
            (identical(other.cardExpDate, cardExpDate) ||
                other.cardExpDate == cardExpDate) &&
            (identical(other.cardCVV, cardCVV) || other.cardCVV == cardCVV) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.selectedCard, selectedCard) ||
                other.selectedCard == selectedCard) &&
            const DeepCollectionEquality()
                .equals(other._creditCards, _creditCards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedTicket,
      isLoading,
      cardNumber,
      cardName,
      cardExpDate,
      cardCVV,
      failure,
      success,
      selectedCard,
      const DeepCollectionEquality().hash(_creditCards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentStateImplCopyWith<_$PaymentStateImpl> get copyWith =>
      __$$PaymentStateImplCopyWithImpl<_$PaymentStateImpl>(this, _$identity);
}

abstract class _PaymentState implements PaymentState {
  const factory _PaymentState(
      {required final Ticket selectedTicket,
      required final bool isLoading,
      required final String cardNumber,
      required final String cardName,
      required final String cardExpDate,
      required final String cardCVV,
      required final String failure,
      required final String success,
      required final CreditCard selectedCard,
      required final List<CreditCard> creditCards}) = _$PaymentStateImpl;

  @override
  Ticket get selectedTicket;
  @override
  bool get isLoading;
  @override
  String get cardNumber;
  @override
  String get cardName;
  @override
  String get cardExpDate;
  @override
  String get cardCVV;
  @override
  String get failure;
  @override
  String get success;
  @override
  CreditCard get selectedCard;
  @override
  List<CreditCard> get creditCards;
  @override
  @JsonKey(ignore: true)
  _$$PaymentStateImplCopyWith<_$PaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
