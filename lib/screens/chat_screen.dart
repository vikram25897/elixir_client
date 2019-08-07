import 'package:elixir_chat_client/components/message_bubble.dart';
import 'package:elixir_chat_client/components/round_clipper.dart';
import 'package:elixir_chat_client/main.dart';
import 'package:responsive_text_field/responsive_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChatScreenUnneeded extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChatScreen();
  }

}

class ChatScreen extends StatefulWidget {
  ChatScreen() : super(key: controller.chatKey);

  createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 600),vsync: this);
    animation = Tween<double>(begin: 0.0,end: 1.0).animate(animationController);
    animation.addListener((){
      setState(() {
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Theme(data: controller.one ?? controller.two, child: ChatScreenActual()),
        ClipPath(
            clipper: RoundClipper(1-animation.value),
            child: Theme(data: controller.two,child: ChatScreenActual(),)
        )
      ],
    );
  }
}

class ChatScreenActual extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final FocusNode focusNodeTemp = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Chat"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Observer(builder: (ctx) {
                return ListView.builder(
                  itemCount: controller.messages.length,
                  reverse: true,
                  itemBuilder: (c, i) {
                    return Padding(
                      padding: EdgeInsets.all(12.0),
                      child: MessageBubble(controller
                          .messages[controller.messages.length - i - 1]),
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.zero,
                      child: ResponsiveTextField(
                        controller: textController,
                        availableWidth: MediaQuery.of(context).size.width - 100,
                        maxLines: 3,
                        minLines: 1,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (s) {
                          print(textController.text);
                          if (s.trim().length != 0) {
                            controller.sendMessage(s.trim());
                            FocusScope.of(context).requestFocus(focusNodeTemp);
                            textController.clear();
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(
                              color: Colors.white,width: 2
                            )),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                                color: Colors.white,width: 2
                            ))),
                        onChanged: (s) {
                          controller.message = s.trim();
                        },
                        focusNode: focusNode,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.message.trim().length != 0) {
                        controller.sendMessage(controller.message.trim());
                        FocusScope.of(context).requestFocus(focusNodeTemp);
                        textController.clear();
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.send,
                          size: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
