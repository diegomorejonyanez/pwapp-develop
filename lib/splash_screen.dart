import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/signup_page.dart';
import 'mains/base_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double size = 500;
  var alignment = Alignment.center;
  //Primer texto
  double visibilityText1 = 0;

  //Segundo texto
  double visibilityText2 = 0;

  //Botón Facebook
  double visibilityFacebook = 0;

  //Botón Google
  double visibilityGoogle = 0;

  //Botón email
  double visibilityEmail = 0;

  int _counter = 8;
  Timer _timer;

  void _startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          print(_counter);
        }
        if (_counter == 7) {
          size = 250;
          alignment = Alignment.bottomCenter;
        }
        if (_counter == 4) {
          visibilityText1 = 1;
        }
        if (_counter == 3) {
          visibilityText2 = 1;
        }
        if (_counter == 2) {
          visibilityFacebook = 1;
        }
        if (_counter == 1) {
          visibilityGoogle = 1;
        }
        if (_counter == 0) {
          visibilityEmail = 1;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  checkStateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null && prefs.getInt('id') != null) {
      Navigator.of(context).pushReplacement(PageTransition(
          type: PageTransitionType.transferRight,
          child: BasePage(),
          duration: Duration(milliseconds: 600)));
    }
  }

  @override
  initState() {
    super.initState();
    checkStateUser();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _startTimer();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 1500),
            opacity: visibilityText1,
            curve: Curves.decelerate,
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Text(
                  'Conoce nuevas amistades, encuentra el amor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 1500),
            opacity: visibilityText2,
            curve: Curves.decelerate,
            child: Container(
                margin: EdgeInsets.only(top: 200),
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Inicia sesión',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    Text(
                      'usando',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 20),
                    )
                  ],
                )),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 1500),
            opacity: visibilityFacebook,
            curve: Curves.decelerate,
            child: Container(
                margin: EdgeInsets.only(top: 300),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/facebook.png',
                  width: MediaQuery.of(context).size.width / 2,
                )),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 1500),
            opacity: visibilityGoogle,
            curve: Curves.decelerate,
            child: Container(
                margin: EdgeInsets.only(top: 380),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/google.png',
                  width: MediaQuery.of(context).size.width / 2,
                )),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 1500),
            opacity: visibilityEmail,
            curve: Curves.decelerate,
            child: GestureDetector(
              onTap: () {
                dispose();
                Navigator.of(context).pushReplacement(PageTransition(
                    type: PageTransitionType.transferRight,
                    child: SignUpPage(),
                    duration: Duration(milliseconds: 600)));
              },
              child: Container(
                  margin: EdgeInsets.only(top: 480),
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    'assets/email.svg',
                    width: MediaQuery.of(context).size.height / 12,
                  )),
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeOutQuad,
            width: size,
            alignment: alignment,
            duration: Duration(milliseconds: 2500),
            child: Image.asset(
              'assets/pretty_logo.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
