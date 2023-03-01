import 'package:flutter/material.dart';
import '../Core/Animation/Fade_Animation.dart';
import '../Core/Colors/Hex_Color.dart';
import '../controller/user_controller.dart';
import '../models/user_model.dart';
import 'componentes/drawer_component.dart';

enum FormData { Name, Phone, Email, Cpf, Address, City, Uf, Cep }

class UserEditPage extends StatefulWidget {
  final User user;
  const UserEditPage({Key? key, required this.user}) : super(key: key);

  @override
  _UserEditPageState createState() => _UserEditPageState(user: user);
}

class _UserEditPageState extends State<UserEditPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color disable = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;
  final User user;

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController cpfController = new TextEditingController();

  TextEditingController addressController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController ufController = new TextEditingController();
  TextEditingController cepController = new TextEditingController();

  _UserEditPageState({required this.user});

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus perfil'),
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Dados Pessoais'),
            Tab(text: 'Edereço'),
          ],
        ),
      ),
      drawer: DrawerComponent(user: user),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.4, 0.7, 0.9],
                colors: [
                  HexColor("#FFFFFF").withOpacity(0.8),
                  HexColor("#FFFFFF"),
                  HexColor("#FFFFFF"),
                  HexColor("#FFFFFF")
                ],
              ),
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
                      color: const Color.fromARGB(255, 171, 211, 250)
                          .withOpacity(0.4),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FadeAnimation(
                              duration: Duration(milliseconds: 500),
                              delay: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return UserEditPage(
                                          user: user,
                                        );
                                      }));
                                    },
                                    child: Text("Meu dados",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            fontSize: 14)),
                                  ),
                                ],
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
                                          : disable,
                                      size: 20,
                                    ),
                                    hintText:
                                        '${user.name!.isEmpty ? "Sem nome cadastrado" : user.name}',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Name
                                            ? enabledtxt
                                            : disable,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Name
                                          ? enabledtxt
                                          : disable,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                                  color: selected == FormData.Email
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: emailController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Email;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : disable,
                                      size: 20,
                                    ),
                                    hintText:
                                        '${user.email!.isEmpty ? "Sem nome cadastrado" : user.email}',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Email
                                            ? enabledtxt
                                            : disable,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : disable,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                                  color: selected == FormData.Phone
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: phoneController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Phone;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: selected == FormData.Phone
                                          ? enabledtxt
                                          : disable,
                                      size: 20,
                                    ),
                                    hintText:
                                        '${user.phone!.isEmpty ? "Sem nome cadastrado" : user.phone}',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Phone
                                            ? enabledtxt
                                            : disable,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Phone
                                          ? enabledtxt
                                          : disable,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                                  color: selected == FormData.Cpf
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: cpfController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Cpf;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.credit_card,
                                      color: selected == FormData.Cpf
                                          ? enabledtxt
                                          : disable,
                                      size: 20,
                                    ),
                                    hintText:
                                        '${user.cpf!.isEmpty ? "Sem CPF cadastrado" : user.cpf}',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Cpf
                                            ? enabledtxt
                                            : disable,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Cpf
                                          ? enabledtxt
                                          : disable,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              duration: Duration(milliseconds: 500),
                              delay: 1,
                              child: TextButton(
                                  onPressed: () {
                                    UserController userController =
                                        UserController();

                                    userController.updateUser(
                                        context,
                                        user,
                                        nameController.text,
                                        emailController.text,
                                        phoneController.text,
                                        cpfController.text);
                                  },
                                  child: Text(
                                    "Enviar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFF2697FF),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14.0, horizontal: 80),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //tab2
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.4, 0.7, 0.9],
                colors: [
                  HexColor("#FFFFFF").withOpacity(0.8),
                  HexColor("#FFFFFF"),
                  HexColor("#FFFFFF"),
                  HexColor("#FFFFFF")
                ],
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    HexColor("#fff").withOpacity(0.9), BlendMode.dstATop),
                image: const NetworkImage(
                  'https://doitall.com.br/img/background2.png',
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
                      color: const Color.fromARGB(255, 171, 211, 250)
                          .withOpacity(0.4),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FadeAnimation(
                              duration: Duration(milliseconds: 500),
                              delay: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return UserEditPage(
                                          user: user,
                                        );
                                      }));
                                    },
                                    child: Text("Endereço",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            fontSize: 14)),
                                  ),
                                ],
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
                                  color: selected == FormData.Address
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: addressController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Address;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.local_activity,
                                      color: selected == FormData.Address
                                          ? enabledtxt
                                          : disable,
                                      size: 20,
                                    ),
                                    hintText:
                                        '${user.address!.isEmpty ? "Sem endereço cadastrado" : user.address}',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Address
                                            ? enabledtxt
                                            : disable,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Address
                                          ? enabledtxt
                                          : disable,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                                  color: selected == FormData.City
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: cityController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.City;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.location_city,
                                      color: selected == FormData.City
                                          ? enabledtxt
                                          : disable,
                                      size: 20,
                                    ),
                                    hintText:
                                        '${user.city!.isEmpty ? "Sem cidade cadastrado" : user.city}',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.City
                                            ? enabledtxt
                                            : disable,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.City
                                          ? enabledtxt
                                          : disable,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                                  color: selected == FormData.Uf
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: ufController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Uf;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.location_history,
                                      color: selected == FormData.Uf
                                          ? enabledtxt
                                          : disable,
                                      size: 20,
                                    ),
                                    hintText:
                                        '${user.uf!.isEmpty ? "Sem UF cadastrada" : user.uf}',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Uf
                                            ? enabledtxt
                                            : disable,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Uf
                                          ? enabledtxt
                                          : disable,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                                  color: selected == FormData.Cep
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: cepController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Cep;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.credit_card,
                                      color: selected == FormData.Cep
                                          ? enabledtxt
                                          : disable,
                                      size: 20,
                                    ),
                                    hintText:
                                        '${user.cep!.isEmpty ? "Sem Cep cadastrado" : user.cep}',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Cep
                                            ? enabledtxt
                                            : disable,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Cep
                                          ? enabledtxt
                                          : disable,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              duration: Duration(milliseconds: 500),
                              delay: 1,
                              child: TextButton(
                                  onPressed: () {
                                    UserController userController =
                                        UserController();

                                    userController.updateUseraddress(
                                        context,
                                        user,
                                        addressController.text,
                                        cityController.text,
                                        ufController.text,
                                        cepController.text);
                                  },
                                  child: Text(
                                    "Enviar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFF2697FF),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14.0, horizontal: 80),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
