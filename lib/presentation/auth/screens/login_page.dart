import 'package:admin_site/core/navigation/router.dart';
import 'package:admin_site/presentation/auth/bloc/login_bloc.dart';
import 'package:admin_site/shared/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<LoginBloc>(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.inverseSurface,
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.4,
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Spacer(
                    flex: 5,
                  ),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(filled: true, border: OutlineInputBorder()),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginStoredState) {
                          context.go(routeMainPage);
                        }
                        if (state is LoginErrorState) {
                          showDialog(
                              context: context,
                              builder: (ctx) => ErrorDialog(
                                    text: "Incorrect Token",
                                  ));
                        }
                      },
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return ElevatedButton(
                              onPressed: state is LoginLoadingState ? null : () => provider.loginToken(controller.text),
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(colorScheme.primaryContainer),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("Enter token")));
                        },
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
