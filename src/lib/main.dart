import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/firebase_options.dart';
import 'package:financialmng/provider/data_provider.dart';
import 'package:financialmng/view/login/welcome.dart';
import 'package:financialmng/view/main_tab/main_tab_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => DataProvider()..loadData(), // Load expenses once
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
            seedColor: TColor.primary,
            surface: TColor.gray80,
            primary: TColor.primary,
            primaryContainer: TColor.gray60,
            secondary: TColor.secondary),
        useMaterial3: false,
      ),
      home: const MainTabView(),
    );
  }
}
