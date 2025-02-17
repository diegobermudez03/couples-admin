import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginState>{
  LoginBloc():super(LoginInitialState());
}



abstract class LoginState{}

class LoginInitialState extends LoginState{}