import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/style/style.dart';

class BookingQRCode extends StatelessWidget {
  const BookingQRCode({
    super.key,
    required this.selectedTicket,
  });

  final Ticket selectedTicket;

  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(color: isDark ? CPColors.grey500 : CPColors.grey300),
        borderRadius: BorderRadius.circular(defaultRadiusSm),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: PrettyQrView.data(
              data: selectedTicket.bookingId,
              errorCorrectLevel: QrErrorCorrectLevel.H,
              decoration: PrettyQrDecoration(
                shape: PrettyQrSmoothSymbol(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          const Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scan QR code at the entrance of the cinema hall',
                  style: CPTextStyle.link(context, color: CPColors.grey500),
                  maxLines: 2,
                  softWrap: true,
                ),
                const Gap(10),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Booking ID: ',
                      ),
                      TextSpan(
                          text: selectedTicket.bookingId,
                          style: CPTextStyle.caption(context,
                              color: CPColors.white)),
                    ],
                    style:
                        CPTextStyle.caption(context, color: CPColors.grey500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
