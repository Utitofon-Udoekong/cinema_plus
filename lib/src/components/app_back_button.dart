import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.sepcialTap});
  final void Function()? sepcialTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: sepcialTap ?? () => context.pop(),
      child: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.onSurface,
        size: 18,
      ),
    );
  }
}
