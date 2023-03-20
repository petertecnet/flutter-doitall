import 'dart:io';

import 'package:doitall/controllers/product_controller.dart';
import 'package:doitall/utils/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum FormData { Name, Price, Description }

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final picker = ImagePicker();
  FormData selected = FormData.Name;
  File _image;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Color.fromARGB(255, 28, 28, 30);
    final Color enabled = Color.fromARGB(255, 48, 48, 49);
    final Color disable = Colors.white.withOpacity(0.3);
    final Color enabledtxt = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Novo Produto/Serviço"),
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: getImage,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: selected == FormData.Name
                          ? enabled
                          : backgroundColor),
                  padding: const EdgeInsets.all(5.0),
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _image,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 50,
                              color: selected == FormData.Name
                                  ? enabledtxt
                                  : disable,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Adicionar imagem',
                              style: TextStyle(
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : disable,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                ),
              ),
             
