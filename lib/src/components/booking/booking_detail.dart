import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jiffy/jiffy.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/style/style.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail(
      {super.key,
      required this.selectedTicket,
      required this.jDate,
      this.canDelete = false, this.onDelete});

  final Ticket selectedTicket;
  final Jiffy jDate;
  final bool canDelete;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(defaultRadiusSm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BookingDetailTile(
            first: true,
            header: ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadiusSm),
              child: FadeInImage.assetNetwork(
                placeholder: AppImages.shimmer,
                image:
                    "${AppStrings.imageUrl}/${selectedTicket.movie.posterPath}",
                width: 80,
                height: 120,
              ),
            ),
            body: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedTicket.movie.title,
                        style: CPTextStyle.headline(context),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      const Gap(10),
                      Text(
                        getViewingSession(jDate.Hm),
                        style:
                            CPTextStyle.link(context, color: CPColors.grey400),
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                if (canDelete)
                  IconButton(
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.delete_rounded,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
              ],
            ),
          ),
          const Gap(20),
          _BookingDetailTile(
            header: const _BookingDetailIcon(
              icon: Icons.calendar_month_rounded,
            ),
            body: _BookingDetailText(
                title: 'DATE & TIME',
                subTitle: '${jDate.MMMMEEEEd} • ${jDate.Hm}'),
          ),
          _BookingDetailTile(
            header: const _BookingDetailIcon(
              icon: Ionicons.tv_outline,
            ),
            body: _BookingDetailText(
              title: 'CINEMA',
              subTitle: selectedTicket.cinema.name,
            ),
          ),
          _BookingDetailTile(
            header: const _BookingDetailIcon(icon: Icons.chair),
            body: _BookingDetailText(
              title: 'HALL & SEATS',
              subTitle: selectedTicket.cinema.seats.asMap().values.join(', '),
              wrap: true,
              wrapPrimary: 'Hall ${selectedTicket.cinema.hall} • Seats: ',
            ),
          ),
          _BookingDetailTile(
            last: true,
            header: const _BookingDetailIcon(
              icon: Icons.location_on,
            ),
            body: _BookingDetailText(
              title: 'LOCATION',
              subTitle: selectedTicket.cinema.location,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingDetailTile extends StatelessWidget {
  const _BookingDetailTile(
      {super.key,
      required this.header,
      required this.body,
      this.first = false,
      this.last = false});

  final Widget body;
  final Widget header;
  final bool first;
  final bool last;
  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

    return Row(
      children: [
        SizedBox(width: 80, child: header),
        const Gap(20),
        Expanded(
          child: Container(
            height: first ? 120 : 80,
            decoration: BoxDecoration(
              border: last
                  ? null
                  : Border(
                      bottom: BorderSide(
                          color: isDark ? CPColors.grey500 : CPColors.grey300),
                    ),
            ),
            child: body,
          ),
        )
      ],
    );
  }
}

class _BookingDetailText extends StatelessWidget {
  const _BookingDetailText(
      {super.key,
      required this.title,
      required this.subTitle,
      this.wrap = false,
      this.wrapPrimary});

  final String title;
  final String subTitle;
  final bool wrap;
  final String? wrapPrimary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: CPTextStyle.link(context, color: CPColors.grey400),
        ),
        const Gap(8),
        wrap
            ? Row(
                children: [
                  Text(
                    wrapPrimary!,
                    style:
                        CPTextStyle.caption(context, weight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        subTitle,
                        style: CPTextStyle.caption(context,
                            weight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            : Text(
                subTitle,
                style: CPTextStyle.caption(context, weight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
      ],
    );
  }
}

class _BookingDetailIcon extends StatelessWidget {
  const _BookingDetailIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: CPColors.grey400,
    );
  }
}
