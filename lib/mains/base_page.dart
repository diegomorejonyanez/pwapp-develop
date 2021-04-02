import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_app/services/api.dart';
import 'package:pretty_app/utils/colors.dart';

import 'home_page.dart';
import 'messages_list_page.dart';
import 'profile_page.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedItemIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedItemIndex == 2
          ? FloatingActionButton(
              onPressed: () {
                ApiService().createRandomChat().then((value) {
                  print(value);
                });
              },
              backgroundColor: oBlue,
              child: Icon(
                Icons.chat_rounded,
              ),
            )
          : Container(),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: oBlue,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            SvgPicture.asset('assets/pretty_app_leader.svg'),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: SvgPicture.asset(
                  'assets/icons/diana.svg',
                  color: Colors.white,
                  width: 40,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          _selectedItemIndex == 2
              ? HomePage()
              : _selectedItemIndex == 3
                  ? MessagesListPage()
                  : _selectedItemIndex == 4
                      ? ProfilePage()
                      : Container(),
          Container(
            padding: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom:
                    BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
              ),
            ),
            child: Row(
              children: [
                buildNavBarItem(
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: SvgPicture.asset(
                        'assets/icons/internet.svg',
                        color: Colors.black,
                        width: 30,
                        height: 20,
                      ),
                    ),
                    0,
                    true),
                buildNavBarItem(
                    Icon(
                      Icons.favorite,
                      size: 30,
                    ),
                    1,
                    false),
                buildNavBarItem(
                    Icon(
                      Icons.video_call_rounded,
                      size: 30,
                    ),
                    2,
                    false),
                buildNavBarItem(
                    Icon(
                      Icons.chat,
                      size: 30,
                    ),
                    3,
                    false),
                buildNavBarItem(
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                    4,
                    false)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavBarItem(Widget icon, int index, bool isActive) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width / 5,
          decoration: index == _selectedItemIndex
              ? BoxDecoration(
                  border: Border(top: BorderSide(width: 4, color: oBlue)),
                  gradient: LinearGradient(colors: [
                    oBlue.withOpacity(0.3),
                    oBlue.withOpacity(0.015)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter))
              : BoxDecoration(),
          child: icon),
    );
  }
}
