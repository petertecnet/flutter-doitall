import 'dart:convert';
import 'package:doitall/models/user_model.dart';
import 'package:doitall/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/Animation/Fade_Animation.dart';
import '../pages/email_verification_page.dart';
import '../pages/login_page.dart';
import '../pages/reset_password_page.dart';

class AuthController {
  Future<void> login(
      BuildContext context, String email, String password) async {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: FadeAnimation(
              delay: 0.5,
              duration: Duration(milliseconds: 500),
              child: Text(
                'Digite o email',
                selectionColor: Colors.red,
              ),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20,
              left: 20),
        ),
      );
      return;
    }
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              'Digite a senha',
              selectionColor: Colors.red,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20,
              left: 20),
        ),
      );
      return;
    }
    final url = Uri.parse('https://doitall.com.br/api/login');
    final response = await http.post(
      url,
      body: {
        'password': password,
        'email': email,
      },
    );
    final json = jsonDecode(response.body);

    if (json['status'] == 200) {
      final user = User.fromJson(json);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);
      await prefs.setString('name', user.name);

      if (user.emailVerifiedAt == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EmailVerificationPage(user: user),
          ),
        );
      }
      if (user.emailVerifiedAt != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(user: user),
          ),
        );
      }
    } else {
      final message = json['message'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Center(child: Text(message)),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> register(
    BuildContext context,
    String name,
    String email,
    String cpf,
    String phone,
    String password,
  ) async {
    final url = Uri.parse('https://doitall.com.br/api/register');

    final response = await http.post(
      url,
      body: {
        'name': name,
        'email': email,
        'cpf': cpf,
        'phone': phone,
        'password': password,
      },
    );
    final json = jsonDecode(response.body);

    if (json['status'] == 200) {
      login(context, email, password);
    } else {
      final message = json['message'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Center(child: Text(message)),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> codevalidation(
    BuildContext context,
    User user,
    String code,
  ) async {
    final url = Uri.parse('https://doitall.com.br/api/codevalidation');

    final response = await http.post(
      url,
      body: {
        'id': user.id.toString(),
        'verification_code': code,
      },
    );
    final json = jsonDecode(response.body);
    user = User.fromJson(json);
    if (json['status'] == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    } else {
      final message = json['message'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Center(child: Text(message)),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> sendemailcode(
    BuildContext context,
    User user,
  ) async {
    final url = Uri.parse('https://doitall.com.br/api/sendemailcode');

    final response = await http.post(
      url,
      body: {
        'id': user.id.toString(),
      },
    );
    final json = jsonDecode(response.body);
    user = User.fromJson(json);
    final message = json['message'];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Center(child: Text(message)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> sendCodeForgotPassword(
    BuildContext context,
    String email,
  ) async {
    final url = Uri.parse('https://doitall.com.br/api/sendCodeForgotPassword');

    final response = await http.post(
      url,
      body: {
        'email': email,
      },
    );
    final json = jsonDecode(response.body);

    final status = json['status'];
    if (status == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordPage(email: email),
        ),
      );
    }
    final message = json['message'];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Center(child: Text(message)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> codevalidationPassword(
    BuildContext context,
    String email,
    String code,
    String password,
  ) async {
    final url = Uri.parse('https://doitall.com.br/api/codevalidationPassword');

    final response = await http.post(
      url,
      body: {'email': email, 'forgotpassword_code': code, 'password': password},
    );
    final json = jsonDecode(response.body);

    final status = json['status'];
    if (status == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
    final message = json['message'];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color.fromARGB(255, 18, 191, 76),
        content: Center(child: Text(message)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
