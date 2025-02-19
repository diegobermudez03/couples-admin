import 'package:admin_site/core/http_client.dart';
import 'package:admin_site/services/tokens_management.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginState>{

  final TokensManagement _tokens;
  final HttpClient _client;
  LoginBloc(this._tokens, this._client):super(LoginInitialState());

  void loginToken(String token)async{
    emit(LoginLoadingState());
    _tokens.setRefreshToken(token);
    final correct = await _client.refreshAccessToken();
    if(correct){
      emit(LoginStoredState());
      return;
    }
    emit(LoginErrorState());
  }
}



abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{}

class LoginStoredState extends LoginState{}

class LoginErrorState extends LoginState{}