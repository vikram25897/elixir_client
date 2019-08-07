import 'package:flutter/material.dart';

class ChatStarted extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("You have Entered The Chat",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
}
