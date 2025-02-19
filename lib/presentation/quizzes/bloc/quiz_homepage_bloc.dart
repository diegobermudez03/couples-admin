import 'package:admin_site/repository/quizzes_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizHomepageBloc extends Cubit<QuizHPageState>{

  final QuizzesRepo _repo;

  QuizHomepageBloc(this._repo):super(QuizHPageInitialState());

  void retrieveInitialPage()async{
    print("trying to retreieve");
    final quizzes = await _repo.getQuizzes();
    if(quizzes.value2 != null){
      print(quizzes.value2!.error);
      return;
    }
    quizzes.value1!.forEach((q)=>print("${q!.id} ${q.name}  ${q.description}"));
  }
}


abstract class QuizHPageState{}

class QuizHPageInitialState extends QuizHPageState{}