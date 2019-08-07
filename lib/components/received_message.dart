import 'package:elixir_chat_client/models/message.dart';
import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  final Message message;

  const ReceivedMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          padding: EdgeInsets.only(left: 10, bottom: 20, top: 8, right: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.zero,
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(message.sender,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),textAlign: TextAlign.start,),
              Text(message.data,style: TextStyle(
                 color: Colors.white
              ),),
            ],
          )),
    );
  }
}
