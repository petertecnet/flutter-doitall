import 'package:doitall/pages/home_page.dart';
import 'package:doitall/pages/login_page.dart';
import 'package:doitall/pages/user_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:doitall/models/user_model.dart';

class DrawerComponent extends StatefulWidget {
  final User user;
  const DrawerComponent({Key? key, required this.user}) : super(key: key);

  @override
  _DrawerComponentState createState() => _DrawerComponentState(user: user);
}

class _DrawerComponentState extends State<DrawerComponent> {
  final User user;

  _DrawerComponentState({required this.user});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.user.name!),
            accountEmail: Text(widget.user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navegue para a página inicial
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(user: widget.user),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Meu perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserEditPage(user: widget.user),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              // Executar o logout
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
