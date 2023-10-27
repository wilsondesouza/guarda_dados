// HomePage servindo de base de acesso para diversas páginas, através de ElevatedButtons e Drawer.

import 'package:flutter/material.dart';
import 'package:guarda_dados/pages/about_page.dart';
import 'package:guarda_dados/pages/consumo_agua.dart';
import 'package:guarda_dados/pages/login_page.dart';
import 'package:guarda_dados/pages/rede_lan.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Home Page', style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic, color: Colors.greenAccent)),
          centerTitle: true,
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              }),
        ),
        drawer: Drawer(
          width: 200,
          shadowColor: Colors.greenAccent,
          backgroundColor: const Color.fromARGB(255, 31, 29, 29),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: const Text(
                          "Sobre",
                          style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.w600, fontSize: 16),
                        ))),
                const Divider(
                  color: Colors.black,
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: const Text(
                          "Sair",
                          style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.w600, fontSize: 16),
                        ))),
              ],
            ),
          ),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Lan1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RedeLan()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    'Rede Lan',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 36,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ConsumoAgua()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text('Consumo de Água',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 36,
                      )),
                ),
              ]),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          foregroundColor: Colors.greenAccent,
          backgroundColor: Colors.black,
          child: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
