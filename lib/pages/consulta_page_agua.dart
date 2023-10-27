// Página de consulta dos dados que foram inseridos na página de registro

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repository/registrar_repository.dart';

class ConsultaPageAgua extends StatefulWidget {
  const ConsultaPageAgua({super.key, Key? chave});

  @override
  State<ConsultaPageAgua> createState() => _ConsultaPageAguaState();
}

class _ConsultaPageAguaState extends State<ConsultaPageAgua> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      var posicaoPaginar = scrollController.position.maxScrollExtent * 0.7;
      if (posicaoPaginar < scrollController.position.pixels) {
        carregarAgua();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var aguaData = Provider.of<AguaData>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Water3.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: aguaData.registros.length,
            itemBuilder: (context, index) {
              Agua agua = aguaData.registros[index];
              return Center(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black87),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    textColor: Colors.white,
                    title: Text(
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        'ID: ${agua.id}'),
                    subtitle: Text(style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 17), 'Data de Entrada: ${agua.dataEntrada}\nValor de Entrada: ${agua.valorEntrada}\nData de Saída: ${agua.dataSaida}\nValor de Saída: ${agua.valorSaida}'),
                    trailing: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        aguaData.removerAgua(index);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
