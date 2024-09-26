import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/primary_button.dart';
import 'package:financialmng/common_widget/round_textfield.dart';
import 'package:financialmng/common_widget/secondary_button.dart';
import 'package:financialmng/view/login/signup_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
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
            const Spacer(),
            RoundTextField(
              label: 'Địa chỉ email',
              controller: txtEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            RoundTextField(
              label: 'Mật khẩu',
              controller: txtPassword,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
            ),
            //password checking progress
            const SizedBox(
              height: 8,
            ),
            //password condition
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Bạn quên mật khẩu?',
                      style: TextStyle(fontSize: 11, color: TColor.gray50),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            PrimaryButton(title: 'Đăng nhập', onPressed: () {}),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpView()));
                })
          ],
        ),
      )),
    );
  }
}
