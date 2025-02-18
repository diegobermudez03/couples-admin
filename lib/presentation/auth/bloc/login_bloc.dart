import 'package:admin_site/services/tokens_management.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginState>{

  final TokensManagement _tokens;
  LoginBloc(this._tokens):super(LoginInitialState());

  void loginToken(String token)async{
    _tokens.setRefreshToken(token);
    emit(LoginStoredState());
  }
}



abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginStoredState extends LoginState{}