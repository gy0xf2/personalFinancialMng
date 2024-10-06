import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/firebase_options.dart';
import 'package:financialmng/provider/data_provider.dart';
import 'package:financialmng/view/authentication_view/multi_auth_view.dart';
import 'package:financialmng/view/authentication_view/signin_view.dart';
import 'package:financialmng/view/authentication_view/signup_view.dart';
import 'package:financialmng/view/authentication_view/welcome.dart';
import 'package:financialmng/view/dashboard_view/dashboard_view.dart';
import 'package:firebase_core/firebase_core.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeView(),
        '/sign-in': (context) => const SignInView(),
        '/sign-up': (context) => const SignUpView(),
        '/multi-auth': (context) => const MultiAuthView(),
        '/dashboard': (context) => const DashboardView(),
      },
      title: 'Personance',
      debugShowCheckedModeBanner: false,
      //
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
      //
    );
  }
}
