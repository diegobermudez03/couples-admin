import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.inverseSurface,
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width*0.4,
          height: MediaQuery.sizeOf(context).height*0.6,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Spacer(flex: 5,),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder()
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                      onPressed: (){}, 
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(colorScheme.primaryContainer),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ))
                      ),
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 20) ,child: Text("Enter token"))
                    ),
                  ),
                  const Spacer(flex: 5,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}