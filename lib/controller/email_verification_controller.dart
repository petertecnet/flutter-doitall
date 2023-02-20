import 'dart:convert';
import 'package:doitall/models/user_model.dart';
import 'package:doitall/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/Animation/Fade_Animation.dart';
import '../pages/email_sent_verification_page.dart';
import '../pages/email_verification_page.dart';

class EmailVerificationController {
  Future<void> emailverification(
      BuildContext context, dynamic id, emailverifiedat) async {
    final url = Uri.parse('https://doitall.com.br/api/resendEmailVerification');
    final response = await http.post(
      url,
      body: {
        'id': id.toString(),
      },
    );

    final json = jsonDecode(response.body);
    final emailVerifiedAt = json['user']['email_verified_at'];
    final user = User(
      id: json['user']['id'],
      status: json['user']['status'],
      role: json['user']['role'],
      name: json['user']['name'],
      phone: json['user']['phone'],
      cpf: json['user']['cpf'],
      token: json['token'],
      email: json['user']['email'],
      emailVerifiedAt: json['user']['email_verified_at'],
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

    final token = json['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    if (emailVerifiedAt != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    }
    if (emailVerifiedAt == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EmailSentVerificationPage(user: user),
        ),
      );
    }
  }
}
