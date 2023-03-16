import 'package:doitall/pages/login_page.dart';
import 'package:doitall/pages/user/user_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:doitall/models/user_model.dart';
import '../../controller/company_controller.dart';
import '../../models/company_model.dart';
import '../company/company_edit_page.dart';
import '../company/new_company_page.dart';
import '../home_page.dart';

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
      width: double.infinity,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.name!),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 500.0,
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder.png',
                  image: user.avatar == null
                      ? "https://doitall.com.br/img/avatar.png"
                      : "https://doitall.com.br/avatars/${user.id}-${user.cpf}/${user.avatar}",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
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
                  builder: (context) => HomePage(user: user),
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
                  builder: (context) => UserEditPage(user: user),
                ),
              );
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.business),
            title: Text('Empresa'),
            children: [
              Visibility(
                visible: user.companyid != null ? false : true,
                child: ListTile(
                  leading: Icon(Icons.business),
                  title: Text('Cadastrar empresa'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewCompanyPage(user: user),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: user.companyid != null ? true : false,
                child: ListTile(
                  leading: Icon(Icons.business),
                  title: Text('Minha empresa'),
                  onTap: () async {
                    final CompanyController companyController =
                        CompanyController();
                    await companyController.index(context, user);
                  },
                ),
              ),
              // adicione mais ListTile aqui, se necessário
            ],
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
