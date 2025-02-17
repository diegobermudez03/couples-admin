import 'package:admin_site/services/tokens_management.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingBloc extends Cubit<LoadingState>{
  final TokensManagement _tokens;
  LoadingBloc(this._tokens):super(LoadingInitialState());

  void checkToken()async{
    final token = await _tokens.getRefreshToken();
    if(token == null){
      emit(LoadingCheckedState(LoadingGoTo.loginPage));
    }else{
      emit(LoadingCheckedState(LoadingGoTo.mainPage));
    }
  }
}


abstract class LoadingState{}

class LoadingInitialState extends LoadingState{}

class LoadingCheckedState extends LoadingState{
  final LoadingGoTo message;
  LoadingCheckedState(this.message);
}

enum LoadingGoTo{
  loginPage, mainPage
}