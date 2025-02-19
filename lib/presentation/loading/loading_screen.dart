import 'package:admin_site/core/navigation/router.dart';
import 'package:admin_site/presentation/loading/loading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoadingBloc, LoadingState>(
        listener: (context, state) {
          if(state is LoadingCheckedState){
            if(state.message == LoadingGoTo.mainPage){
              context.go(routeMainPage);
            }else{
              context.go(routeLogin);
            }
          }
        },
        child: Container(),
      ),
    );
  }
}
