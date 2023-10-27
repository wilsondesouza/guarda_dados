// Página utilizando um PageView com o único propósito de servir como intermediária entre as páginas de Consulta e Registro

import 'package:flutter/material.dart';
import 'package:guarda_dados/pages/consulta_page_lan.dart';
import 'package:guarda_dados/pages/registrar_page_lan.dart';

class RedeLan extends StatefulWidget {
  const RedeLan({super.key, Key? chave});

  @override
  State<RedeLan> createState() => _RedeLanState();
}

class _RedeLanState extends State<RedeLan> {
  int indexPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Rede Lan', style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic, color: Colors.greenAccent)),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 31, 29, 29),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      indexPage = value;
                    });
                  },
                  children: const [
                    RegistrarPageLan(),
                    ConsultaPageLan(),
                  ],
                ),
              ),
              BottomNavigationBar(
                backgroundColor: const Color.fromARGB(255, 31, 29, 29),
                selectedItemColor: Colors.greenAccent,
                unselectedItemColor: Colors.white,
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: indexPage,
                items: const [
                  BottomNavigationBarItem(
                    label: "Registrar Usuário",
                    backgroundColor: Colors.greenAccent,
                    icon: Icon(Icons.add),
                  ),
                  BottomNavigationBarItem(label: "Consultar Usuário", icon: Icon(Icons.find_in_page)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
