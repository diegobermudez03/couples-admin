import 'package:admin_site/core/dependency_injection/dep_in.dart';
import 'package:admin_site/core/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await initializeDepedencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Admin web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 112, 214, 255),
          brightness: Brightness.light,
          dynamicSchemeVariant: DynamicSchemeVariant.vibrant
        ),
        textTheme: GoogleFonts.comfortaaTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}