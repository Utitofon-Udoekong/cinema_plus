import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/components/components.dart'
    show CreditCardPlaceholder, PageHeader, CPSnackbar, AppTextField, AppButton;
import 'package:cinema_plus/src/constants/constants.dart' show defaultPadding;
import 'package:cinema_plus/src/features/payment/cubit/payment_cubit.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  FocusNode cardNumberFocusNode = FocusNode();
  FocusNode cardNameFocusNode = FocusNode();
  FocusNode expFocusNode = FocusNode();
  FocusNode cvvFocusNode = FocusNode();

  bool focusCardName = false;
  bool focusCardNumber = false;
  bool focusCVV = false;
  bool focusEXP = false;

  _onCNFNChange() {
    setState(() {
      if (cardNameFocusNode.hasFocus) {
        focusCardName = true;
        focusCardNumber = false;
        focusCVV = false;
        focusEXP = false;
      }
    });
  }

  _onCNumFNChange() {
    setState(() {
      if (cardNumberFocusNode.hasFocus) {
        focusCardNumber = true;
        focusCardName = false;
        focusCVV = false;
        focusEXP = false;
      }
    });
  }

  _onEXPFNChange() {
    if (expFocusNode.hasFocus) {
      setState(() {
        focusEXP = true;
        focusCardName = false;
        focusCVV = false;
        focusCardNumber = false;
      });
    }
  }

  _onCVVFNChange() {
    if (cvvFocusNode.hasFocus) {
      setState(() {
        focusCVV = true;
        focusCardName = false;
        focusCardNumber = false;
        focusEXP = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    cardNameFocusNode.addListener(_onCNFNChange);
    cardNumberFocusNode.addListener(_onCNumFNChange);
    expFocusNode.addListener(_onEXPFNChange);
    cvvFocusNode.addListener(_onCVVFNChange);
  }

  @override
  void dispose() {
    cardNameFocusNode.dispose();
    cardNumberFocusNode.dispose();
    expFocusNode.dispose();
    cvvFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((PaymentCubit bloc) => bloc.state.isLoading);
    return MultiBlocListener(
      listeners: [
        BlocListener<PaymentCubit, PaymentState>(
          listenWhen: (p, c) => c.success == 'Card added',
          listener: (context, state) {
            context.read<PaymentCubit>().resetCard();
            context.pop();
          },
        ),
        BlocListener<PaymentCubit, PaymentState>(
          listenWhen: (p, c) => p.failure != c.failure && c.failure.isNotEmpty,
          listener: (context, state) {
            CPSnackbar.showError(context, state.failure);
          },
        ),
      ],
      child: Scaffold(
        appBar: const PageHeader(title: 'Payment'),
        body: SafeArea(
          child: Padding(
            padding: defaultPadding,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CreditCardPlaceholder(
                          focusCardName: focusCardName,
                          focusCardNumber: focusCardNumber,
                          focusEXP: focusEXP,
                          focusCVV: focusCVV,
                        ),
                        const Gap(30),
                        AppTextField(
                          keyboardType: TextInputType.number,
                          focusNode: cardNumberFocusNode,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            _CardNumberFormatter(),
                            LengthLimitingTextInputFormatter(
                                19), // Limit to 19 digits
                          ],
                          hint: 'XXXX XXXX XXXX XXXX',
                          textInputAction: TextInputAction.next,
                          onChanged: (value) =>
                              context.read<PaymentCubit>().setCardNumber(value),
                        ),
                        const Gap(15),
                        AppTextField(
                            focusNode: cardNameFocusNode,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z ]*$')),
                            ],
                            hint: 'Enter card holder name',
                            textInputAction: TextInputAction.next,
                            onChanged: (value) => context
                                .read<PaymentCubit>()
                                .setCardName(value)),
                        const Gap(15),
                        Row(
                          children: [
                            Expanded(
                              child: AppTextField(
                                  keyboardType: TextInputType.number,
                                  focusNode: expFocusNode,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    _CreditCardExpiryDateFormatter(),
                                    LengthLimitingTextInputFormatter(
                                        5), // Limit to 5 characters (MM/YY)
                                  ],
                                  hint: 'MM/YY',
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) => context
                                      .read<PaymentCubit>()
                                      .setCardExpDate(value)),
                            ),
                            const Gap(10),
                            Expanded(
                              child: AppTextField(
                                  keyboardType: TextInputType.number,
                                  focusNode: cvvFocusNode,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  hint: 'Enter CVV',
                                  textInputAction: TextInputAction.done,
                                  onChanged: (value) => context
                                      .read<PaymentCubit>()
                                      .setCardCVV(value)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                AppButton(
                    title: 'ADD PAYMENT METHOD',
                    isLoading: isLoading,
                    ontap: () {
                      context.read<PaymentCubit>().addCard();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var inputText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      if (i + 1 != inputText.length && (i + 1) % 4 == 0) {
        bufferString.write('-');
      }
    }
    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var inputText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    if (inputText.length > 2) {
      inputText = '${inputText.substring(0, 2)}/${inputText.substring(2)}';
    }
    return newValue.copyWith(
      text: inputText,
      selection: TextSelection.collapsed(offset: inputText.length),
    );
  }
}

class _CreditCardExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove non-numeric characters
    final newText = newValue.text;

    // Format the date with a slash
    final formattedText = '${newText.substring(0, 2)}/${newText.substring(2)}';

    // Limit the input to 5 characters (MM/YY)
    final limitedText = formattedText.substring(0, 5);
    print(limitedText);
    // Validate the expiry date
    final expiryMonth = int.tryParse(limitedText.substring(0, 2)) ?? 0;
    final expiryYear = int.tryParse(
            DateTime.now().year.toString().substring(0, 2) +
                limitedText.substring(3, 5)) ??
        0;
    final currentDate = DateTime.now();
    final currentMonth = currentDate.month;
    final currentYear = currentDate.year;

    if (expiryMonth < 1 ||
        expiryMonth > 12 ||
        expiryYear < currentYear ||
        (expiryYear == currentYear && expiryMonth <= currentMonth)) {
      // Invalid expiry date
      return TextEditingValue.empty;
    }

    return TextEditingValue(
      text: limitedText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: limitedText.length),
      ),
    );
  }
}
