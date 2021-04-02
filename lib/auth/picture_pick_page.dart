import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:pretty_app/mains/base_page.dart';
import 'package:pretty_app/services/api.dart';
import 'package:pretty_app/utils/colors.dart';

import '../splash_screen.dart';

class PicturePickPage extends StatefulWidget {
  //Paso las variables desde las pantallas anteriores hacía esta para usarlas a través de las pantallas
  final String email;
  final String password;
  final String name;
  final String description;
  final String dateTime;
  final String mySex;
  final String prefSex;

  PicturePickPage(
      {this.description,
      this.email,
      this.name,
      this.password,
      this.dateTime,
      this.mySex,
      this.prefSex});
  @override
  _PicturePickPageState createState() => _PicturePickPageState();
}

class _PicturePickPageState extends State<PicturePickPage> {
  String errorMessage = '';
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Si ven tu rostro, tienes más oportunidades de llamar la atención y que las personas quieran conocerte',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: oRed, width: 4.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Image.asset('assets/profile_picture.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: oBlue),
                child: Row(
                  children: [
                    Icon(Icons.photo_size_select_actual_outlined,
                        color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Subir foto desde la galería',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: oBlue),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt_outlined, color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Tomar foto con la cámara',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              hasError == true
                  ? Container(
                      child: Text(
                        errorMessage,
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () async {
                  ApiService()
                      .registerUser(
                          context: context,
                          email: widget.email,
                          name: widget.name,
                          password: widget.password,
                          dateTime: widget.dateTime,
                          description: widget.description,
                          mySex: widget.mySex,
                          prefSex: widget.prefSex)
                      .then((var value) {
                    if (value['success'] == false) {
                      setState(() {
                        errorMessage = value['error'].toString();
                        hasError = true;
                      });
                    } else if (value['success'] == true) {
                      Navigator.of(context).pushReplacement(PageTransition(
                          type: PageTransitionType.transferRight,
                          child: BasePage(),
                          duration: Duration(milliseconds: 600)));
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: oBlue),
                  child: Text(
                    'Siguiente',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(PageTransition(
                        type: PageTransitionType.transferRight,
                        child: SplashScreen(),
                        duration: Duration(milliseconds: 600)));
                  },
                  child: Text(
                    'Volver a inicio de sesión',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
