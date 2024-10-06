import 'package:financialmng/message/notification_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //sign up function
  Future<User?> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          NotificationMessage.showNotificationMessage(
              context,
              'Địa chỉ email này đã được sử dụng!',
              Colors.red.shade700,
              Icons.error);
          break;
        case 'invalid-email':
          NotificationMessage.showNotificationMessage(context,
              'Địa chỉ email không hợp lệ!', Colors.red.shade700, Icons.error);
          break;
        case 'weak-password':
          NotificationMessage.showNotificationMessage(
              context,
              'Mật khẩu cần có độ dài tối thiểu 6 kí tự!',
              Colors.red.shade700,
              Icons.error);
          break;
        default:
          break;
      }
    }
    return null;
  }

  //sign in function
  Future<User?> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
        case 'user-not-found':
        case 'wrong-password':
          NotificationMessage.showNotificationMessage(
              context,
              'Tài khoản hoặc mật khẩu không chính xác!',
              Colors.red.shade800,
              Icons.error);
          break;
        default:
          NotificationMessage.showNotificationMessage(
              context,
              'Có lỗi đã xảy ra. Vui lòng thử lại!',
              Colors.grey.shade700,
              Icons.error);
      }
    }
    return null;
  }
}
