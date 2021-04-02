import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String apiUrl = 'http://api.prettywomanapp.com/';

  addUserToLocal({String token, int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt('id', id);
  }

  getTokenFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token;
  }

  getIntFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id');
    return id;
  }

  Future registerUser(
      {context,
      String email,
      String password,
      String name,
      String description,
      String dateTime,
      String mySex,
      String prefSex}) async {
    dynamic data = {
      "action": "register",
      "register": {
        "username": name,
        "email": email,
        "password": password,
        "dateTime": dateTime,
        "description": description,
        "mySex": mySex,
        "prefSex": prefSex
      }
    };
    final http.Response response =
        await http.post(apiUrl + 'session', body: json.encode(data), headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36'
    });
    var responseData = json.decode(response.body);
    if (responseData['success'] == true) {
      print(responseData);
      addUserToLocal(id: responseData['id'], token: responseData['token']);
      return responseData;
    } else if (responseData['success'] == false) {
      print(responseData['error']);
      return responseData;
    }
  }

  Future loginUser({String email, String password, context}) async {
    dynamic data = {
      "action": "login",
      "login": {"email": email, "password": password}
    };
    final http.Response response =
        await http.post(apiUrl + 'session', body: json.encode(data), headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36'
    });
    var responseData = json.decode(response.body);
    if (responseData['success'] == true) {
      addUserToLocal(id: responseData['id'], token: responseData['token']);
      return responseData;
    } else if (responseData['success'] == false) {
      print(responseData);
      return responseData;
    }
  }

  Future getChatList() async {
    int id = await getIntFromLocal();
    String token = await getTokenFromLocal();
    dynamic data = {
      "action": "list",
      "user": {"id": id, "token": token}
    };
    final http.Response response =
        await http.post(apiUrl + 'chat/get', body: json.encode(data), headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36'
    });
    var responseData = json.decode(response.body);
    if (responseData['success'] == true) {
      print(responseData['chats']);
      return responseData['chats'];
    } else {
      print(responseData['error']);
      return responseData['error'];
    }
  }

  Stream getChats(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getChatList();
    }
  }

  Future getChat(String chatId) async {
    int id = await getIntFromLocal();
    String token = await getTokenFromLocal();
    dynamic data = {
      'action': 'chat',
      'user': {'id': id, 'token': token},
      'chat': {'id': chatId}
    };
    final http.Response response =
        await http.post(apiUrl + 'chat/get', body: json.encode(data), headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36'
    });
    var responseData = json.decode(response.body);
    if (responseData['success'] == true) {
      print(responseData);
      return responseData;
    } else {
      print(responseData['error']);
      return responseData['error'];
    }
  }

  Stream getMessages({Duration refreshTime, String chatId}) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getChat(chatId);
    }
  }

  Future writeMessage({int userId, String message, int chatId}) async {
    int id = await getIntFromLocal();
    String token = await getTokenFromLocal();
    dynamic data = {
      "action": "chat",
      "user": {
        "id": id,
        "token": token,
      },
      "msg": {"user": userId, "text": message, "chat_id": chatId}
    };
    final http.Response response = await http
        .post(apiUrl + 'chat/send', body: json.encode(data), headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36'
    });
    var responseData = json.decode(response.body);
    if (responseData['success'] == true) {
      print(responseData);
      return responseData;
    } else {
      print(responseData['error']);
      print(responseData);
      return responseData['error'];
    }
  }

  Future createRandomChat() async {
    int id = await getIntFromLocal();
    String token = await getTokenFromLocal();
    dynamic data = {
      "action": "chat",
      "user": {
        "id": id,
        "token": token,
      },
      "random": true,
    };
    final http.Response response = await http
        .post(apiUrl + 'chat/send', body: json.encode(data), headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36'
    });
    var responseData = json.decode(response.body);
    if (responseData['success'] == true) {
      print(responseData);
      return responseData;
    } else {
      print(responseData['error']);
      print(responseData);
      return responseData['error'];
    }
  }
}
