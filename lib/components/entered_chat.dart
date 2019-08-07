import 'package:elixir_chat_client/models/message.dart';
import 'package:flutter/material.dart';

class EnteredChat extends StatelessWidget{
  final Message message;
  EnteredChat(this.message);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width*0.8
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: RichText(
          text: TextSpan(
            text: message.data,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text: " has entered the chat.",
                style: TextStyle(
                  color: Colors.grey[850]
                )
              )
            ]
          ),
        ),
      ),
    );
  }

}