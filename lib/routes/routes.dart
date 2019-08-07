import 'package:elixir_chat_client/screens/chat_screen.dart';
import 'package:elixir_chat_client/screens/enter_name.dart';
import 'package:flutter/material.dart';

routes(){
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      routes: {
        "/chat":(c)=>ChatScreenUnneeded()
      },
      home: EnterNameScreen(),
    )
  );
}