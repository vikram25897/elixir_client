import 'package:elixir_chat_client/models/message.dart';
import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  final Message message;

  const SentMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          padding: EdgeInsets.only(left: 10, bottom: 20, top: 8, right: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.zero,
                bottomRight: Radius.circular(20)),
          ),
          child: Text(message.data,style:TextStyle(
            color: message.sent ? Colors.white : Colors.white30
          ),),
    ));
  }
}
