import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lan {
  final String nome;
  final String rede;
  final String mac;
  final String ip;
  final String tipoAparelho;

  Lan({
    required this.nome,
    required this.rede,
    required this.mac,
    required this.ip,
    required this.tipoAparelho,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'rede': rede,
      'MAC': mac,
      'IP': ip,
      'tipoAparelho': tipoAparelho,
    };
  }

  factory Lan.fromJson(Map<String, dynamic> json) {
    return Lan(nome: json['nome'], rede: json['rede'], mac: json['MAC'], ip: json['IP'], tipoAparelho: json['tipoAparelho']);
  }
}

Future<void> salvarLan(List<Lan> lan) async {
  final prefs = await SharedPreferences.getInstance();
  final lanJson = lan.map((lan) => jsonEncode(lan.toJson())).toList();
  await prefs.setStringList('lan', lanJson);
}

Future<List<Lan>> carregarLan() async {
  final prefs = await SharedPreferences.getInstance();
  final lanJson = prefs.getStringList('lan');
  if (lanJson == null) {
    return [];
  }
  return lanJson.map((carroJson) => Lan.fromJson(jsonDecode(carroJson))).toList();
}

class LanData extends ChangeNotifier {
  List<Lan> registros = [];

  LanData(List<Lan> lan) {
    registros = lan;
  }

  void adicionarLan(Lan lan) {
    registros.add(lan);
    salvarLan(registros);
    notifyListeners();
  }

  void removerLan(int index) {
    registros.removeAt(index);
    salvarLan(registros);
    notifyListeners();
  }
}

class RegistrarPageLan extends StatelessWidget {
  const RegistrarPageLan({super.key, Key? chave});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController redeController = TextEditingController();
    final TextEditingController macController = TextEditingController();
    final TextEditingController ipController = TextEditingController();
    final TextEditingController tipoAparelhoController = TextEditingController();

    var lanData = Provider.of<LanData>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Lan2.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(70.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 40.0),
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: redeController,
                  decoration: const InputDecoration(labelText: 'Rede', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: macController,
                  decoration: const InputDecoration(labelText: 'Endereço MAC', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: ipController,
                  decoration: const InputDecoration(labelText: 'Endereço IP', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: tipoAparelhoController,
                  decoration: const InputDecoration(labelText: 'Tipo do Aparelho', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    String nome = nomeController.text;
                    String rede = redeController.text;
                    String mac = macController.text;
                    String ip = ipController.text;
                    String tipoAparelho = tipoAparelhoController.text;

                    if (nome.isEmpty || rede.isEmpty || mac.isEmpty || tipoAparelho.isEmpty || ip.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text('Preencha todos os campos obrigatórios.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Lan carro = Lan(
                        nome: nome,
                        rede: rede,
                        mac: mac,
                        ip: ip,
                        tipoAparelho: tipoAparelho,
                      );

                      lanData.adicionarLan(carro);

                      nomeController.clear();
                      redeController.clear();
                      macController.clear();
                      ipController.clear();
                      tipoAparelhoController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.greenAccent, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
