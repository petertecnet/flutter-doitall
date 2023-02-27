import 'package:doitall/models/user_model.dart';
import 'package:doitall/pages/user_edit_page.dart';
import 'package:flutter/material.dart';

import 'components/drawer_component.dart';
import 'login_page.dart';

enum FormData {
  Email,
  password,
}

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(user: user);
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();

  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

  final User user;

  _HomePageState({required this.user});

  Widget _body() {
    return Form(
      key: _formkey,
      child: Column(
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://doitall.com.br/img/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.1),
          ),
          _body(),
        ],
      ),
    );
  }
}
