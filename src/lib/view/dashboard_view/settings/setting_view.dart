import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/view/dashboard_view/settings/item/setting_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'CÀI ĐẶT',
                        style: TextStyle(
                            fontSize: 14,
                            color: TColor.gray30,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),

              //
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/u1.png',
                    width: 70,
                    height: 70,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'johndoe@gmail.com',
                    style: TextStyle(
                        color: TColor.gray30,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: TColor.border.withOpacity(0.15)),
                      color: TColor.gray60.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Chỉnh sửa thông tin',
                    style: TextStyle(
                        fontSize: 12,
                        color: TColor.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 15),
                      child: Text(
                        'Cài đặt chung',
                        style: TextStyle(
                            fontSize: 14,
                            color: TColor.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    //////
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: TColor.border.withOpacity(0.1)),
                          color: TColor.gray60.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Column(
                        children: [
                          SettingRow(
                              icon: 'assets/img/face_id.png',
                              title: 'Bảo mật',
                              value: 'FaceID'),
                          SettingRow(
                              icon: 'assets/img/money.png',
                              title: 'Đơn vị tiền tệ',
                              value: 'VNĐ'),
                          SettingRow(
                              icon: 'assets/img/light_theme.png',
                              title: 'Chủ đề',
                              value: 'Tối'),
                          SettingRow(
                              icon: 'assets/img/font.png',
                              title: 'Phông chữ',
                              value: 'Inter'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, '/');
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: TColor.border.withOpacity(0.15)),
                      color: TColor.gray60.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Đăng xuất',
                        style: TextStyle(
                            fontSize: 12,
                            color: TColor.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        'assets/img/logout.png',
                        width: 20,
                        height: 20,
                        color: TColor.gray30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
