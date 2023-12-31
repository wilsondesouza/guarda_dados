// Página de consulta dos dados que foram inseridos na página de registro

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repository/registrar_repository.dart';

class ConsultaPageLan extends StatefulWidget {
  const ConsultaPageLan({super.key, Key? chave});

  @override
  State<ConsultaPageLan> createState() => _ConsultaPageLanState();
}

class _ConsultaPageLanState extends State<ConsultaPageLan> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      var posicaoPaginar = scrollController.position.maxScrollExtent * 0.7;
      if (posicaoPaginar < scrollController.position.pixels) {
        carregarLan();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var aguaData = Provider.of<LanData>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Lan3.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: aguaData.registros.length,
            itemBuilder: (context, index) {
              Lan lan = aguaData.registros[index];
              return Container(
                decoration: const BoxDecoration(color: Colors.black87),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  title: Text(
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      'Nome: ${lan.nome}'),
                  textColor: Colors.white,
                  subtitle: Text(style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 17), 'Rede: ${lan.rede}\nEndereço MAC: ${lan.mac}\nEndereço IP: ${lan.ip}\nTipo de Aparelho: ${lan.tipoAparelho}'),
                  trailing: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      aguaData.removerLan(index);
                    },
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
