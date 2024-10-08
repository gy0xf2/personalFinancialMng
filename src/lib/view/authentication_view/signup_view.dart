// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:financialmng/auth/firebase_authentication.dart';
import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/primary_button.dart';
import 'package:financialmng/common_widget/input_field/round_textfield.dart';
import 'package:financialmng/common_widget/button/secondary_button.dart';
import 'package:financialmng/message/notification_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final FirebaseAuthentication _auth = FirebaseAuthentication();
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();
  @override
  void dispose() {
    _txtEmail.dispose();
    _txtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        icon: Image.asset(
                          'assets/img/back.png',
                          width: 18,
                          height: 18,
                          color: TColor.gray30,
                        ))
                  ],
                )
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ĐĂNG KÝ TÀI KHOẢN',
                    style: TextStyle(
                        fontSize: 14,
                        color: TColor.gray10,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundTextField(
              icon: FontAwesomeIcons.at,
              label: 'Địa chỉ email',
              controller: _txtEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 25,
            ),
            RoundTextField(
              icon: FontAwesomeIcons.key,
              label: 'Mật khẩu',
              controller: _txtPassword,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            //password checking progress

            const SizedBox(
              height: 8,
            ),
            //password condition
            const SizedBox(
              height: 15,
            ),
            PrimaryButton(title: 'Bắt đầu mĩễn phí', onPressed: _signUp),
            const Spacer(),
            Text(
              'Bạn đã có tài khoản?',
              style: TextStyle(fontSize: 11, color: TColor.white),
            ),
            const SizedBox(
              height: 18,
            ),
            //sign in
            SecondaryButton(
                title: 'Đăng nhập',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                }),
          ],
        ),
      )),
    );
  }

  void _signUp() async {
    String _email = _txtEmail.text;
    String _password = _txtPassword.text;
    User? user =
        await _auth.signUpWithEmailAndPassword(context, _email, _password);
    if (user != null && mounted) {
      //notify success
      NotificationMessage.showNotificationMessage(context,
          'Đăng ký thành công!', Colors.green[400], Icons.check_circle);
      await Future.delayed(const Duration(seconds: 5)); // Simulate a delay

      Navigator.pushNamed(context, '/sign-in');
    } else {}
  }
}
