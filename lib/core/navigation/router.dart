import 'package:admin_site/presentation/auth/bloc/login_bloc.dart';
import 'package:admin_site/presentation/auth/screens/login_page.dart';
import 'package:admin_site/presentation/loading/loading_bloc.dart';
import 'package:admin_site/presentation/loading/loading_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

const routeDefault = "/";
const routeLogin = "/login";

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
]);
