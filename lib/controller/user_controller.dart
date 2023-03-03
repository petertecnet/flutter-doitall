import 'dart:convert';
import 'package:doitall/pages/user_edit_Page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../pages/email_verification_page.dart';
import 'dart:io';

class UserController {
  Future<void> updatePhoto(BuildContext context, User user, File photo) async {
    final url = Uri.parse('https://doitall.com.br/api/userupdatephoto');
    final request = http.MultipartRequest('PUT', url);
    request.fields['id'] = user.id.toString();
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ${user.token}',
    });
    request.files.add(
      await http.MultipartFile.fromPath(
        'photo',
        photo.path,
      ),
    );
    final response = await request.send();
    final json = jsonDecode(await response.stream.bytesToString());

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

  Future<void> updatePassword(BuildContext context, User user,
      String currentlyPassword, String newPassword) async {
    final name = user.name!;
    final phone = user.phone!;
    final email = user.email!;
    final cpf = user.cpf!;
    final url = Uri.parse('https://doitall.com.br/api/userupdate');
    final body = {
      'id': user.id.toString(),
      'currentlyPassword': currentlyPassword,
      'newPassword': newPassword,
      'name': name,
      'phone': phone,
      'email': email,
      'cpf': cpf
    };
    final response = await http.put(url, body: body);
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
    }
    if (json['status'] == 400) {
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

  Future<void> changeemailcodevalidation(
      BuildContext context, User user, String code) async {
    final url =
        Uri.parse('https://doitall.com.br/api/changeemailcodevalidation');

    final body = {'id': user.id.toString(), 'verification_code': code};
    final response = await http.post(url, body: body);
    final json = jsonDecode(response.body);

    if (json['status'] == 200) {
      final user = User.fromJson(json);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);
      await prefs.setString('name', user.name);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserEditPage(user: user),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 14, 227, 32),
          content: Text(json['message']),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    if (json['status'] == 400) {
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
