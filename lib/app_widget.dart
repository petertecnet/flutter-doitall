import 'package:flutter/material.dart';
import 'package:doitall/pages/home_page.dart';
import 'package:doitall/pages/email_verification_page.dart';
import 'package:doitall/pages/forgotpassword_page.dart';
import 'package:doitall/pages/new_register_page.dart';
import 'package:doitall/pages/login_page.dart';
import 'app_controller.dart';
import 'models/user_model.dart';

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
            '/emailverificationpage': (context) => EmailVerificationPage(),
          },
        );
      },
    );
  }
}
