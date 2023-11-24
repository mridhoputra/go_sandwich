import 'package:go_sandwich/provider/main_provider.dart';
import 'package:go_sandwich/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const GoSandwich());
}

class GoSandwich extends StatefulWidget {
  const GoSandwich({super.key});

  @override
  State<GoSandwich> createState() => _GoSandwichState();
}

class _GoSandwichState extends State<GoSandwich> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Go Sandwich',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
        ),
      ),
    );
  }
}
