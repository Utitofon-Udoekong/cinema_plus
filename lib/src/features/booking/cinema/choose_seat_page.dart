import 'package:auto_route/auto_route.dart';
import 'package:cinema_plus/src/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          )),
          AppButton(title: 'PROCEED TO CHECKOUT', isLoading: false)
        ],
      )),
    );
  }
}