import 'package:doitall/pages/auth/reset_password_page.dart';
import 'package:doitall/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:doitall/pages/home_page.dart';
import 'package:doitall/pages/user/user_edit_page.dart';
import 'package:doitall/pages/auth/email_verification_page.dart';
import 'package:doitall/pages/auth/forgotpassword_page.dart';
import 'package:doitall/pages/auth/new_register_page.dart';
import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  var user;

  AppWidget();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/homepage': (context) => HomePage(
                  user: user,
                ),
            '/newregisterpage': (context) => NewRegisterPage(),
            '/forgotpasswordpage': (context) => ForgotpasswordPage(),
            '/ResetPasswordPage': (context) => ResetPasswordPage(email: ''),
            '/emailverificationpage': (context) => EmailVerificationPage(
                  user: user,
                ),
            '/usereditpage': (context) => UserEditPage(
                  user: user,
                ),
          },
        );
      },
    );
  }
}
