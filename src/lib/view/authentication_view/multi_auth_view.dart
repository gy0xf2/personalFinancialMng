import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/secondary_button.dart';
import 'package:financialmng/view/authentication_view/signup_view.dart';
import 'package:flutter/material.dart';

class MultiAuthView extends StatefulWidget {
  const MultiAuthView({super.key});

  @override
  State<MultiAuthView> createState() => _MultiAuthViewState();
}

class _MultiAuthViewState extends State<MultiAuthView> {
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
            //signup with google button
            InkWell(
              onTap: () {},
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: TColor.white.withOpacity(0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 7))
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/img/google_btn.png'))),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/google.png',
                      width: 18,
                      height: 18,
                      color: TColor.gray,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Đăng ký bằng Google',
                      style: TextStyle(
                          fontSize: 14,
                          color: TColor.gray,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            //signup with facebook button
            InkWell(
              onTap: () {},
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 7))
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/img/fb_btn.png'))),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/fb.png',
                      width: 18,
                      height: 18,
                      color: TColor.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Đăng ký bằng Facebook',
                      style: TextStyle(
                          fontSize: 14,
                          color: TColor.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'hoặc',
              style: TextStyle(fontSize: 11, color: TColor.white),
            ),
            const SizedBox(
              height: 25,
            ),
            //register by email
            SecondaryButton(
                title: 'Đăng ký bằng email',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                }),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Bằng việc nhấn vào nút "Đăng ký", bạn đồng ý với Điều khoản về Dịch vụ của chúng tôi.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: TColor.white),
            )
          ],
        ),
      )),
    );
  }
}
