import 'package:financial_mng/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Financial Management',
      theme: ThemeData(
          colorScheme: ColorScheme.light(
        surface: Colors.grey.shade100,
        onSurface: Colors.black,
        primary: const Color(0xff00b2e7),
        secondary: const Color(0xffe064f7),
        tertiary: const Color(0xffff8d6c),
        outline: Colors.grey,
      )),
      home: const HomeScreen(),
    );
  }
}
