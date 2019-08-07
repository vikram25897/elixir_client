import 'package:elixir_chat_client/models/message.dart';
import 'package:flutter/material.dart';

class LeftChat extends StatelessWidget{
  final Message message;
  LeftChat(this.message);
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
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: RichText(
          text: TextSpan(
              text: message.data,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18
              ),
              children: [
                TextSpan(
                    text: " has left the chat.",
                    style: TextStyle(
                        color: Colors.black,
                      fontSize: 14
                    )
                )
              ]
          ),
        ),
      ),
    );
  }

}