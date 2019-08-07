import 'package:elixir_chat_client/utils/not_null_map.dart';

class Message{
  String data;
  bool sent = false;
  String sender;
  String messageId;
  MessageType messageType;
  Message({this.data,this.messageId,this.sender,this.sent,this.messageType});

  factory Message.sent({String data,String messageId,}){
    return Message(data: data,messageId: messageId,messageType: MessageType.SENT);
  }

  factory Message.received({String data, String sender}){
    return Message(sender: sender,data: data,messageType: MessageType.RECEIVED);
  }

  Map toJson(){
    return NotNullMapBuilder.fromMap({
      "message":data,
      "message_id":messageId,
    }).build();
  }
}
enum MessageType{
  SENT,
  RECEIVED,
  CHAT_STARTED,
  ENTERED_CHAT,
  LEFT_CHAT
}