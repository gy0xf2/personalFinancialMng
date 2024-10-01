import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/primary_button.dart';
import 'package:financialmng/common_widget/input_field/round_textfield.dart';
import 'package:financialmng/common_widget/button/secondary_button.dart';
import 'package:financialmng/view/login/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
              icon: FontAwesomeIcons.at,
              label: 'Địa chỉ email',
              controller: txtEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            RoundTextField(
              icon: FontAwesomeIcons.key,
              label: 'Mật khẩu',
              controller: txtPassword,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            //password checking progress
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                        color: TColor.gray70,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                        color: TColor.gray70,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                        color: TColor.gray70,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                        color: TColor.gray70,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            //password condition
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Mật khẩu phải có ít nhất 8 kí tự và được tạo bởi việc kết hợp chữ cái, số và kí tứ đặc biệt.',
                    style: TextStyle(fontSize: 11, color: TColor.gray50),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            PrimaryButton(title: 'Bắt đầu mĩễn phí', onPressed: () {}),
            const Spacer(),
            Text(
              'Bạn đã có tài khoản?',
              style: TextStyle(fontSize: 11, color: TColor.white),
            ),
            const SizedBox(
              height: 20,
            ),
            //sign in
            SecondaryButton(
                title: 'Đăng nhập',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()));
                }),
          ],
        ),
      )),
    );
  }
}
