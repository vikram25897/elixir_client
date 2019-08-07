import 'dart:convert';
import 'dart:io';

import 'package:elixir_chat_client/models/message.dart';
import 'package:elixir_chat_client/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'chat_controller.g.dart';

class ChatController = _AbstractChatController with _$ChatController;

abstract class _AbstractChatController with Store {
  @observable
  bool socketConnected = false;

  GlobalKey<ChatScreenState> chatKey = GlobalKey<ChatScreenState>();

  @observable
  bool socketConnecting = false;

  ThemeData one;
  ThemeData two;

  String message = "";

  @observable
  ObservableList<String> members = ObservableList<String>();

  @observable
  Socket socket;

  @observable
  bool enteredChat = false;

  @observable
  ObservableList<Message> messages = ObservableList<Message>();

  Utf8Decoder _decoder = Utf8Decoder();

  @observable
  String connectionError;

  _AbstractChatController() {
    startConnect();
  }

  @action
  startConnect() async {
    print("starting connection");
    try {
      socketConnecting = true;
      socket = await Socket.connect("10.0.15.120", 6000,
          timeout: Duration(seconds: 5));
      socketConnecting = false;
      socketConnected = true;
      print("connected");
      socket.listen(_handleData, onError: (e) {
        connectionError = e.message;
      });
    } catch (ex) {
      socketConnecting = false;
      connectionError = ex.toString();
      print(ex);
    }
  }

  @action
  notifyChange() {
    messages = messages;
  }

  @action
  _handleData(List<int> data) {
    var json = jsonDecode(_decoder.convert(data));
    print(json);
    switch (json['type'].trim()) {
      case "message_sent":
        {
          messages.forEach((m) {
            if (m.messageId == json['message_id'].trim()) {
              m.sent = true;
            }
            notifyChange();
          });
          break;
        }
      case "message_received":
        {
          messages.add(Message(
              data: json['message'].trim(),
              sender: json['sender'].trim(),
              messageType: MessageType.RECEIVED));
          break;
        }
      case "entered_chat":
        {
          members.addAll(List<String>.generate(
              json["members"].length, (i) => json["members"][i] as String));
          messages.add(Message(
            messageType: MessageType.CHAT_STARTED,
          ));
          two = fromMap(json['theme']);
          enteredChat = true;
          break;
        }
      case "welcome":
        {
          members.add(json["who"].trim());
          messages.add(Message(
              messageType: MessageType.ENTERED_CHAT, data: json["who"].trim()));
          break;
        }
      case "gone":
        {
          members.remove(json["who"].trim());
          messages.add(Message(
              messageType: MessageType.LEFT_CHAT, data: json["who"].trim()));
        }
    }
    if (json['type'].trim() != "entered_chat") {
      ThemeData thm = fromMap(json['theme']);
      if (chatKey.currentState.animationController.isDismissed) {
        if (!equals(thm, two)) {
          one = thm;
          chatKey.currentState.animationController.forward();
        }
      } else if (chatKey.currentState.animationController.isCompleted) {
        two = thm;
        chatKey.currentState.animationController.reverse();
      }
    }
  }

  @action
  sendMessage(String data) {
    Message message = Message(
        data: data,
        messageId: Uuid().v4(),
        messageType: MessageType.SENT,
        sent: false);
    messages.add(message);
    socket.write(jsonEncode(message.toJson()));
    socket.flush();
  }

  @action
  sendHello(String name) {
    socket.write(json.encode({"name": name}));
    List<int> bytes;
    socket.write(bytes);
    socket.flush();
  }

}

ThemeData fromMap(Map json) {
  return ThemeData(
      buttonColor: Color(int.parse(json["sent_bubble_color"])).withOpacity(1.0),
      primaryColor: Color(int.parse(json["main_theme_color"])).withOpacity(1.0),
      cardColor: Color(int.parse(json["received_bubble_color"])).withOpacity(1.0),
      accentColor: Color(int.parse(json["background_color"])).withOpacity(1.0));
}

bool equals(ThemeData one, ThemeData two) {
  return one.buttonColor == two.buttonColor &&
      one.primaryColor == two.primaryColor &&
      one.cardColor == two.cardColor &&
      one.accentColor == two.accentColor;
}
