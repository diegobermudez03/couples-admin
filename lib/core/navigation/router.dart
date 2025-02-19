import 'package:admin_site/presentation/auth/bloc/login_bloc.dart';
import 'package:admin_site/presentation/auth/screens/login_page.dart';
import 'package:admin_site/presentation/loading/loading_bloc.dart';
import 'package:admin_site/presentation/loading/loading_screen.dart';
import 'package:admin_site/presentation/main/screens/main_page.dart';
import 'package:admin_site/presentation/quizzes/bloc/quiz_homepage_bloc.dart';
import 'package:admin_site/presentation/quizzes/screens/quizzes_homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

const routeDefault = "/";
const routeLogin = "/login";
const routeMainPage = "/main";
const routeQuizzesMainPage = "/quizzes/homepage";

final router = GoRouter(routes: [
  GoRoute(
    path: routeDefault,
    builder: (_, __) => BlocProvider(
      create: (context) => GetIt.instance.get<LoadingBloc>(),
      child: LoadingScreen(),
    ),
    pageBuilder: GoTransitions.openUpwards.call,
  ),
  GoRoute(
    path: routeLogin,
    builder: (_, __) => BlocProvider(
      create: (context) => GetIt.instance.get<LoginBloc>(),
      child: LoginPage(),
    ),
    pageBuilder: GoTransitions.openUpwards.call,
  ),
  GoRoute(
    path: routeMainPage,
    builder: (_, __) => MainPage(),
    pageBuilder: GoTransitions.openUpwards.call,
  ),
  GoRoute(
    path: routeQuizzesMainPage,
    builder: (_, __) => BlocProvider(
        create: (context) => GetIt.instance.get<QuizHomepageBloc>(),
        child: QuizzesHomepage(),
    ),
    pageBuilder: GoTransitions.openUpwards.call,
  ),
]);
