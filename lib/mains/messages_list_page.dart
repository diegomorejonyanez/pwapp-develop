import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:pretty_app/profiles/chat_page.dart';
import 'package:pretty_app/services/api.dart';

class MessagesListPage extends StatefulWidget {
  @override
  _MessagesListPageState createState() => _MessagesListPageState();
}

class _MessagesListPageState extends State<MessagesListPage> {
  List<Map<dynamic, dynamic>> chatList = [
    {
      'name': 'Cristina',
      'lastMessage': 'Hola',
      'date': '12 de marzo 2021 11:32PM',
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'state': 'unreaded',
      'id': '2'
    },
    {
      'name': 'Cristina',
      'lastMessage': 'Hola',
      'date': '12 de marzo 2021 11:32PM',
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'state': 'unreaded',
      'id': '2'
    },
    {
      'name': 'Cristina',
      'lastMessage': 'Hola',
      'date': '12 de marzo 2021 11:32PM',
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'state': 'unreaded',
      'id': '2'
    },
    {
      'name': 'Cristina',
      'lastMessage': 'Hola',
      'date': '12 de marzo 2021 11:32PM',
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'state': 'unreaded',
      'id': '2'
    },
    {
      'name': 'Cristina',
      'lastMessage': 'Hola',
      'date': '12 de marzo 2021 11:32PM',
      'image':
          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg',
      'state': 'unreaded',
      'id': '2'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mensajes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Expanded(
            child: StreamBuilder(
                stream: ApiService().getChats(Duration(seconds: 1)),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        Map<dynamic, dynamic> chat = snapshot.data[index];
                        return InkWell(
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                  type: PageTransitionType.transferRight,
                                  child: ChatPage(
                                    chatId: chat['id'],
                                    chatName: chat['name'],
                                    userId: chat['user_from'],
                                  ),
                                  duration: Duration(milliseconds: 600)));
                            },
                            child: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 12.0, // soften the shadow
                                        spreadRadius: -1.0, //extend the shadow
                                        offset: Offset(
                                          -1.0, // Move to right 10  horizontally
                                          5.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://1.bp.blogspot.com/-k0UMqqbIu80/XLjR4yNvJRI/AAAAAAAAIgg/h7it2cOlQNQvhosikvxnHZnoeMj5opXJACLcBGAs/s1600/mujer.jpg'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              chat['last_updated'] == null
                                                  ? 'No hay mensajes recientes'
                                                  : chat['last_updated'],
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          chat['name'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          chat['last_message'] == null
                                              ? 'No hay mensajes recientes'
                                              : chat['last_message'],
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    )
                                  ],
                                )));
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }
}
