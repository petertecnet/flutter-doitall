import 'package:flutter/material.dart';

import 'login_page.dart';

enum FormData {
  Email,
  password,
}

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

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
        title: Text('Minha tela'),
        leading: IconButton(
          icon: Icon(Icons.menu), // icone de menu padrão do Flutter
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // cor de fundo do menu
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                    'Nome do Usuário'), // substitua pelo nome do usuário logado
                accountEmail: Text(
                    'email@exemplo.com'), // substitua pelo email do usuário logado
                currentAccountPicture: CircleAvatar(
                  child: Text(
                      'N'), // substitua pela primeira letra do nome do usuário logado
                ),
                decoration: BoxDecoration(
                  color: backgroundColor, // cor de fundo do cabeçalho do menu
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), // ícone do item do menu
                title: Text('Início'), // título do item do menu
                onTap: () {
                  Navigator.pop(context);
                  // implemente a navegação para a tela desejada
                },
              ),
              ListTile(
                leading: Icon(Icons.settings), // ícone do item do menu
                title: Text('Configurações'), // título do item do menu
                onTap: () {
                  Navigator.pop(context);
                  // implemente a navegação para a tela desejada
                },
              ),
              ListTile(
                leading: Icon(Icons.logout), // ícone do item do menu
                title: Text('Sair'), // título do item do menu
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                  // implemente a navegação para a tela desejada
                },
              ),
              // adicione quantos itens do menu desejar
            ],
          ),
        ),
      ),
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
