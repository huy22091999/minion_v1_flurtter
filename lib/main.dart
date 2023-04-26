
import 'package:flutter/material.dart';
import 'package:minion_v1/data/repository/login_repository.dart';
import 'package:minion_v1/page/home/home_state.dart';
import 'package:minion_v1/page/home/home_view_model.dart';
import 'package:minion_v1/page/security/login_view_model.dart';
import 'package:minion_v1/page/security/splash_page.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  HomeState homeState=HomeState();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => LoginViewModel(loginRepository: LoginRepository())),
        Provider(create: (context) => HomeViewModel(homeState,repository: LoginRepository())),
        ChangeNotifierProvider(create: (context) => homeState),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
