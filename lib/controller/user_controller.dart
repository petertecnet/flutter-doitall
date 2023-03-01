import 'dart:convert';

import 'package:doitall/pages/user_edit_Page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../pages/email_verification_page.dart';

class UserController {
  Future<void> updateUser(BuildContext context, User user, String name,
      String email, String phone, String cpf) async {
    if (name.isEmpty) name = user.name!;
    if (phone.isEmpty) phone = user.phone!;
    if (email.isEmpty) email = user.email!;
    if (cpf.isEmpty) cpf = user.cpf!;
    final url = Uri.parse('https://doitall.com.br/api/userupdate');
    final body = {
      'id': user.id.toString(),
      'name': name,
      'email': email,
      'phone': phone,
      'cpf': cpf
    };
    final response = await http.put(url, body: body);
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
        email: json['user']['email'],
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(json['message']),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserEditPage(user: user),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 3, 3),
          content: Text(json['message']),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> updateUseraddress(BuildContext context, User user,
      String address, String city, String uf, String cep) async {
    if (address.isEmpty) address = user.address!;
    if (city.isEmpty) city = user.city!;
    if (uf.isEmpty) uf = user.uf!;
    if (cep.isEmpty) cep = user.cep!;
    final url = Uri.parse('https://doitall.com.br/api/userupdate');
    final body = {
      'id': user.id.toString(),
      'address': address,
      'city': city,
      'uf': uf,
      'cep': cep
    };
    final response = await http.put(url, body: body);
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
        email: json['user']['email'],
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(json['message']),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserEditPage(user: user),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 3, 3),
          content: Text(json['message']),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
