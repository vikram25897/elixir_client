import 'package:elixir_chat_client/components/chat_started.dart';
import 'package:elixir_chat_client/components/entered_chat.dart';
import 'package:elixir_chat_client/components/left_chat.dart';
import 'package:elixir_chat_client/components/received_message.dart';
import 'package:elixir_chat_client/components/sent_message.dart';
import 'package:elixir_chat_client/models/message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget{
  final Message message;
  const MessageBubble(this.message);
  @override
  Widget build(BuildContext context) {
    switch(message.messageType){
      case MessageType.SENT:
        return SentMessage(message);
      case MessageType.RECEIVED:
        return ReceivedMessage(message);
      case MessageType.CHAT_STARTED:
        return ChatStarted();
      case MessageType.ENTERED_CHAT:
        return EnteredChat(message);
      case MessageType.LEFT_CHAT:
        return LeftChat(message);
    }
    return SizedBox();
  }
}