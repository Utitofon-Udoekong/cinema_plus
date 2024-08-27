import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget implements PreferredSizeWidget {
  const PageHeader({super.key, required this.title, this.sepcialTap, this.showBack = true});

  final String title;
  final bool showBack;
  final void Function()? sepcialTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBack ? AppBackButton(sepcialTap: sepcialTap) : null,
      leadingWidth: 80,
      centerTitle: true,
      title: Text(
        title,
        style: CPTextStyle.body(context, weight: FontWeight.bold),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
