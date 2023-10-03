import 'package:flutter/material.dart';
import 'my_app.dart';
import 'pages/registrar_page_lan.dart';
import 'pages/registrar_page_agua.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final agua = await carregarAgua();
  final lan = await carregarLan();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AguaData(agua)),
        ChangeNotifierProvider(create: (context) => LanData(lan)),
      ],
      child: const MyApp(),
    ),
  );
}
