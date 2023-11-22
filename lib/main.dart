import 'package:go_sandwich/router.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp.router(
      routerConfig: router,
      title: 'Belajar Pencak Silat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
    );
  }
}
