import 'package:flutter/material.dart';
import 'package:guarda_dados/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      title: "Guarda Dados",
      color: const Color.fromARGB(255, 31, 29, 29),
      home: const LoginPage(),
      initialRoute: '/',
    );
  }
}
