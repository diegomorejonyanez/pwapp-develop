import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splash_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('token');
          prefs.remove('id');
          Navigator.of(context).pushReplacement(PageTransition(
              type: PageTransitionType.transferRight,
              child: SplashScreen(),
              duration: Duration(milliseconds: 600)));
        },
        child: Row(
          children: [
            Text('Cerrar sesión'),
            Icon(
              Icons.logout,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
