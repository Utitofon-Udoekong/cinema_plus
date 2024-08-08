import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';

class AppLoaderSM extends StatelessWidget {
  const AppLoaderSM({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 25,
        height: 25,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 3,
          backgroundColor: CPColors.white,
        ),
      ),
    );
  }
}
