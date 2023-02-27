import 'package:doitall/models/user_model.dart';
import 'package:flutter/material.dart';
import '../controller/email_verification_controller.dart';
import '../Core/Animation/Fade_Animation.dart';
import 'login_page.dart';

enum FormData {
  Email,
  password,
}

class EmailVerificationPage extends StatefulWidget {
  final User user;

  const EmailVerificationPage({Key? key, required this.user}) : super(key: key);

  @override
  State<EmailVerificationPage> createState() =>
      _EmailVerificationPageState(user: user);
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _formkey = GlobalKey<FormState>();

  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

  final User user;

  _EmailVerificationPageState({required this.user});

  Widget _body() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
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
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  FadeAnimation(
                    duration: Duration(milliseconds: 500),
                    delay: 0.2,
                    child: Image.network(
                      "https://doitall.com.br/img/logo.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Text(
                    'Olá,  ${user.name}!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Verifique seu endereço de e-mail',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Email: ${user.email}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Antes de prosseguir, por favor, veja se recebeu o link de verificação em seu e-mail. Se você não recebeu o e-mail,',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text('Jà confirmei meu email'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 70, 38, 197)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      EmailVerificationController emailVerificationController =
                          EmailVerificationController();
                      emailVerificationController.emailverification(
                          context, user.id, user.emailVerifiedAt);
                    },
                    child: Text('clique aqui para enviar outro'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email de verificação enviado'),
        leading: IconButton(
          icon: Icon(Icons.menu), // icone de menu padrão do Flutter
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
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
