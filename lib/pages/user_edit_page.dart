import 'dart:convert';
import 'package:flutter/material.dart';
import '../Core/Animation/Fade_Animation.dart';
import '../Core/Colors/Hex_Color.dart';
import '../models/user_model.dart';
import 'components/drawer_component.dart';

enum FormData { Name, Phone, Email }

class UserEditPage extends StatefulWidget {
  final User user;

  const UserEditPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserEditPage> createState() => _UserEditPageState(user: user);
}

class _UserEditPageState extends State<UserEditPage> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

  final User user;

  _UserEditPageState({required this.user});

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu perfil'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: DrawerComponent(user: user),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                HexColor("#fff").withOpacity(0.9), BlendMode.dstATop),
            image: const NetworkImage(
              'https://doitall.com.br/img/background.png',
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  color:
                      const Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeAnimation(
                          delay: 1,
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            child: Text(
                              "Meus dados  ",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Name
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: nameController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.Name;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.title,
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText:
                                    '${user.name.isEmpty ? "Sem nome cadastrado" : user.name}',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Name
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //End of Center Card
                //Start of outer card
              ],
            ),
          ),
        ),
      ),
    );
  }
}
