import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:pretty_app/utils/colors.dart';

import '../splash_screen.dart';
import 'picture_pick_page.dart';

class BasicInfoPage extends StatefulWidget {
  final String email;
  final String password;
  BasicInfoPage({this.email, this.password});
  @override
  _BasicInfoPageState createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends State<BasicInfoPage> {
  String _dateTime;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  int mySex = 0;

  bool _wSex = false;
  bool _mSex = false;

  bool _hasProblem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    '¿Cómo te llamas?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Debes poner tu nombre';
                      }
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Fecha de nacimiento',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: oBlue, width: 1.0, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime(2002 - 02 - 27),
                      maximumYear: DateTime.now().year - 18,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (dateTime) {
                        print(dateTime.toString().substring(0, 10));
                        setState(() {
                          _dateTime = dateTime.toString().substring(0, 10);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Debes ser mayor de 18 años para usar Pretty App',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    '¿Cuál es tu sexo?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            mySex = 1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: mySex == 1 ? oBlue : Colors.white,
                            border: Border.all(
                                color: oBlue,
                                width: 4.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Masculino',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mySex == 1 ? Colors.white : oBlue),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            mySex = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: mySex == 2 ? oRed : Colors.white,
                            border: Border.all(
                                color: oRed,
                                width: 4.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Femenino',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mySex == 2 ? Colors.white : oRed),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    '¿Qué deseas conocer?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_mSex == true) {
                              _mSex = false;
                            } else {
                              _mSex = true;
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: _mSex ? oBlue : Colors.white,
                            border: Border.all(
                                color: oBlue,
                                width: 4.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Masculino',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _mSex ? Colors.white : oBlue),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_wSex == true) {
                              _wSex = false;
                            } else {
                              _wSex = true;
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: _wSex ? oRed : Colors.white,
                            border: Border.all(
                                color: oRed,
                                width: 4.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Femenino',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _wSex ? Colors.white : oRed),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Cuéntanos de tí',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    maxLength: 280,
                    maxLines: 10,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Debes poner una descripción';
                      }
                    },
                  ),
                  Text(
                    'Aumenta tus posibilidades de conocer el amor con una pequeña descripción de hasta 280 carácteres',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: _hasProblem ? 30 : 0,
                    child: Text(
                      'Te faltó llenar algún campo o seleccionar una opción',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      int _gSex = 0;
                      if (_wSex == true && _mSex == false) {
                        _gSex = 2;
                      } else if (_wSex == false && _mSex == true) {
                        _gSex = 1;
                      } else if (_wSex == true && _mSex == true) {
                        _gSex = 3;
                      }
                      if (_formKey.currentState.validate() &&
                          mySex != 0 &&
                          _gSex != 0) {
                        print(widget.email.toString() +
                            '  ' +
                            widget.password.toString() +
                            '  ' +
                            _descriptionController.text +
                            '  ' +
                            _nameController.text +
                            '  ' +
                            _dateTime.toString() +
                            '  ' +
                            mySex.toString() +
                            '  ' +
                            _gSex.toString());
                        Navigator.of(context).push(PageTransition(
                            type: PageTransitionType.transferRight,
                            child: PicturePickPage(
                              email: widget.email,
                              password: widget.password,
                              description: _descriptionController.text,
                              name: _nameController.text,
                              dateTime: _dateTime.toString(),
                              mySex: mySex.toString(),
                              prefSex: _gSex.toString(),
                            ),
                            duration: Duration(milliseconds: 600)));
                      } else {
                        setState(() {
                          _hasProblem = true;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: oBlue),
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
                    height: 20,
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  SizedBox(
                    height: 20,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
