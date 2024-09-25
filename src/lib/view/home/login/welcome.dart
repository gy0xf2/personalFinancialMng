import 'package:financialmng/common_widget/primary_button.dart';
import 'package:financialmng/common_widget/secondary_button.dart';
import 'package:financialmng/view/home/login/social_view_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/img/welcome_screen.png',
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                PrimaryButton(
                    title: 'Bắt đầu!',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SocialViewLogin()));
                    }),
                const SizedBox(
                  height: 20,
                ),
                SecondaryButton(title: 'Tôi đã có tài khoản', onPressed: () {})
              ],
            ),
          ))
        ],
      ),
    );
  }
}
