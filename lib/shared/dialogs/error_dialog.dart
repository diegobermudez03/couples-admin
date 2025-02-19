import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget{

  final String text;

  const ErrorDialog({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Error"),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: ()=>Navigator.of(context).pop(), 
          child: Text("ok")
        )
      ],
    );
  }
}