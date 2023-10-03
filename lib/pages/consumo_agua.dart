import 'package:flutter/material.dart';
import 'package:guarda_dados/pages/consulta_page_agua.dart';
import 'package:guarda_dados/pages/registrar_page_agua.dart';

class ConsumoAgua extends StatefulWidget {
  const ConsumoAgua({super.key, Key? chave});

  @override
  State<ConsumoAgua> createState() => _ConsumoAguaState();
}

class _ConsumoAguaState extends State<ConsumoAgua> {
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
            title: const Text('Consumo de Água', style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic, color: Colors.greenAccent)),
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
                    RegistrarPageAgua(),
                    ConsultaPageAgua(),
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
                    BottomNavigationBarItem(label: "Registrar Consumo", icon: Icon(Icons.add)),
                    BottomNavigationBarItem(label: "Consultar Consumo", icon: Icon(Icons.find_in_page)),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
