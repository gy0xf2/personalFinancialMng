// ignore_for_file: prefer_final_fields

import 'package:financialmng/auth/firebase_authentication.dart';
import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/primary_button.dart';
import 'package:financialmng/common_widget/input_field/round_textfield.dart';
import 'package:financialmng/common_widget/button/secondary_button.dart';
import 'package:financialmng/view/authentication_view/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final FirebaseAuthentication _auth = FirebaseAuthentication();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();

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
                    'ĐĂNG NHẬP',
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
            const SizedBox(height: 25),
            RoundTextField(
              icon: FontAwesomeIcons.key,
              label: 'Mật khẩu',
              controller: _txtPassword,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
            ),
            //password checking progress
            const SizedBox(
              height: 20,
            ),
            //password condition
            const SizedBox(
              height: 6,
            ),
            PrimaryButton(title: 'Đăng nhập', onPressed: _signIn),
            const Spacer(),
            Text(
              'Nếu bạn chưa có tài khoản?',
              style: TextStyle(fontSize: 11, color: TColor.white),
            ),
            const SizedBox(
              height: 20,
            ),
            //sign in
            SecondaryButton(
                title: "Đăng ký",
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                })
          ],
        ),
      )),
    );
  }

  void _signIn() async {
    String _email = _txtEmail.text;
    String _password = _txtPassword.text;
    User? user =
        await _auth.signInWithEmailAndPassword(context, _email, _password);
    if (user != null && mounted) {
      //notify success
      Navigator.pushNamed(context, '/dashboard');
    } else {}
  }
}
