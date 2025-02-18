import 'package:admin_site/core/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget{
  const MainPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            const Spacer(),
            OptionButton(
              text: "Quizes", 
              callback: ()=>context.push(routeQuizzesMainPage)
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}


class OptionButton extends StatelessWidget{
  final String text;
  final void Function() callback;

  const OptionButton({
    super.key,
    required this.text,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback, 
      child: Text(text)
    );
  }
}