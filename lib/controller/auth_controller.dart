import 'dart:convert';
import 'package:doitall/controller/email_verification_controller.dart';
import 'package:doitall/models/user_model.dart';
import 'package:doitall/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/Animation/Fade_Animation.dart';
import '../pages/email_verification_page.dart';

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
      final token = json['token'];
      final emailVerifiedAt = json['user']['email_verified_at'];

      final user = User(
        id: json['user']['id'],
        status: json['user']['status'],
        role: json['user']['role'],
        name: json['user']['name'],
        phone: json['user']['phone'],
        cpf: json['user']['cpf'],
        token: 'token $token',
        email: email,
        emailVerifiedAt: emailVerifiedAt,
        address: json['user']['address'],
        city: json['user']['city'],
        uf: json['user']['uf'],
        twoFactorSecret: json['user']['two_factor_secret'],
        twoFactorRecoveryCodes: json['user']['two_factor_recovery_codes'],
        twoFactorConfirmedAt: json['user']['two_factor_confirmed_at'],
        uid: json['user']['uid'],
        createdAt: DateTime.parse(json['user']['created_at']),
        updatedAt: DateTime.parse(json['user']['updated_at']),
        deletedAt: json['user']['deleted_at'],
      );
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
}
