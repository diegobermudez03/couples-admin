import 'package:admin_site/presentation/auth/bloc/login_bloc.dart';
import 'package:admin_site/presentation/loading/loading_bloc.dart';
import 'package:admin_site/services/secure_storage_service.dart';
import 'package:admin_site/services/tokens_management.dart';
import 'package:get_it/get_it.dart';

final depIn = GetIt.instance;

Future<void> initializeDepedencies()async{
  final SecureStorageService secureStorage = SecureStorageImplementation();
  final TokensManagement tokens = TokensManagement(secureStorage);


  depIn.registerFactory<LoginBloc>(()=>LoginBloc());
  depIn.registerFactory<LoadingBloc>(()=>LoadingBloc(tokens)..checkToken());
}