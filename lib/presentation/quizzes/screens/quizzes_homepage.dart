import 'package:admin_site/presentation/quizzes/bloc/quiz_homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizzesHomepage extends StatelessWidget{

  const QuizzesHomepage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<QuizHomepageBloc>(context);
    print(bloc);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text("data"),
            )
          ),
          Expanded(
            flex: 3,
            child: Container(),
          )
        ],
      ),
    );
  }
}