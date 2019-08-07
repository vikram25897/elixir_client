import 'package:elixir_chat_client/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
class EnterNameScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(builder: (context) {
          if(controller.enteredChat)
            WidgetsBinding.instance.addPostFrameCallback((_){
              Navigator.of(context).pushReplacementNamed("/chat");
            });
          return controller.socketConnected
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()
                        ),
                        onSubmitted: (s){
                          print(s);
                          controller.sendHello(s);
                        },
                      ),
                    ),
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        controller.sendHello(textEditingController.text);
                      },
                      child: Text(
                        "Enter Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              : controller.connectionError != null
                  ? Text(
                      controller.connectionError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 26,
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text(
                          "Connecting To The Elixir Server",
                          textAlign: TextAlign.center,
                        )
                      ],
                    );
        }),
      ),
    );
  }
}
