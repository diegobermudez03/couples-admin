import 'package:admin_site/core/http_client.dart';
import 'package:admin_site/presentation/auth/bloc/login_bloc.dart';
import 'package:admin_site/presentation/loading/loading_bloc.dart';
import 'package:admin_site/presentation/quizzes/bloc/quiz_homepage_bloc.dart';
import 'package:admin_site/repository/impl/quizzes_repo_impl.dart';
import 'package:admin_site/repository/quizzes_repo.dart';
import 'package:admin_site/services/secure_storage_service.dart';
import 'package:admin_site/services/tokens_management.dart';
import 'package:get_it/get_it.dart';

final depIn = GetIt.instance;

final url = "http://localhost:8081/v1";

Future<void> initializeDepedencies()async{
  final SecureStorageService secureStorage = SecureStorageMock();
  final TokensManagement tokens = TokensManagement(secureStorage);

  final HttpClient client = HttpClient(url, tokens);
  // repositories
  final QuizzesRepo quizRepo = QuizzesRepoImpl(client, url);


  depIn.registerFactory<LoginBloc>(()=>LoginBloc(tokens, client));
  depIn.registerFactory<LoadingBloc>(()=>LoadingBloc(tokens)..checkToken());
  depIn.registerFactory<QuizHomepageBloc>(()=>QuizHomepageBloc(quizRepo)..retrieveInitialPage());
}