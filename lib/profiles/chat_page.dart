import 'package:flutter/material.dart';
import 'package:pretty_app/services/api.dart';
import 'package:pretty_app/utils/colors.dart';

class ChatPage extends StatefulWidget {
  final int chatId;
  final String chatName;
  final int userId;
  const ChatPage({this.chatId, this.chatName, this.userId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            widget.chatName,
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //StreamBuilder
              Expanded(
                child: StreamBuilder(
                  stream: ApiService().getMessages(
                      refreshTime: Duration(seconds: 1),
                      chatId: widget.chatId.toString()),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data['chat'].length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Map<dynamic, dynamic> chat = snapshot.data['chat']
                              [snapshot.data['chat'].length - index - 1];

                          return Container(
                            alignment: chat['sent'] == true
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            child: Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 2 -
                                            20),
                                decoration: chat['sent'] == true
                                    ? BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)))
                                    : BoxDecoration(
                                        color: oBlue,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: chat['sent'] == true
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chat['message'],
                                      style: TextStyle(
                                          color: chat['sent'] == true
                                              ? oBlue
                                              : Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      chat['created']
                                          .toString()
                                          .substring(10, 19),
                                      style: TextStyle(
                                          color: chat['sent'] == true
                                              ? oBlue.withOpacity(0.4)
                                              : Colors.white54,
                                          fontSize: 12),
                                    ),
                                  ],
                                )),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              Container(
                  decoration: BoxDecoration(),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 10, bottom: 20, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Escribe un mensaje...',
                                hintStyle: TextStyle(color: Colors.black38)),
                          ),
                        )),
                        FloatingActionButton(
                          onPressed: () {
                            if (_messageController.text.isNotEmpty) {
                              ApiService().writeMessage(
                                  chatId: widget.chatId,
                                  message: _messageController.text.toString(),
                                  userId: widget.userId);
                              _messageController.clear();
                            }
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 16,
                          ),
                          backgroundColor: oBlue,
                          elevation: 0,
                          mini: true,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
