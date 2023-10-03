import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Agua {
  final String id;
  final String dataEntrada;
  final String valorEntrada;
  final String dataSaida;
  final String valorSaida;

  Agua({
    required this.id,
    required this.dataEntrada,
    required this.valorEntrada,
    required this.dataSaida,
    required this.valorSaida,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dataEntrada': dataEntrada,
      'valorEntrada': valorEntrada,
      'dataSaida': dataSaida,
      'valorSaida': valorSaida,
    };
  }

  factory Agua.fromJson(Map<String, dynamic> json) {
    return Agua(
      id: json['id'],
      dataEntrada: json['dataEntrada'],
      valorEntrada: json['valorEntrada'],
      dataSaida: json['dataSaida'],
      valorSaida: json['valorSaida'],
    );
  }
}

Future<void> salvarAgua(List<Agua> aguas) async {
  final prefs = await SharedPreferences.getInstance();
  final aguasJson = aguas.map((carro) => jsonEncode(carro.toJson())).toList();
  await prefs.setStringList('agua', aguasJson);
}

Future<List<Agua>> carregarAgua() async {
  final prefs = await SharedPreferences.getInstance();
  final aguasJson = prefs.getStringList('agua');
  if (aguasJson == null) {
    return [];
  }
  return aguasJson.map((aguaJson) => Agua.fromJson(jsonDecode(aguaJson))).toList();
}

class AguaData extends ChangeNotifier {
  List<Agua> registros = [];

  AguaData(List<Agua> agua) {
    registros = agua;
  }

  void adicionarAgua(Agua agua) {
    registros.add(agua);
    salvarAgua(registros);
    notifyListeners();
  }

  void removerAgua(int index) {
    registros.removeAt(index);
    salvarAgua(registros);
    notifyListeners();
  }
}

class RegistrarPageAgua extends StatelessWidget {
  const RegistrarPageAgua({super.key, Key? chave});

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController dataEntradaController = TextEditingController();
    final TextEditingController valorEntradaController = TextEditingController();
    final TextEditingController dataSaidaController = TextEditingController();
    final TextEditingController valorSaidaController = TextEditingController();

    var aguaData = Provider.of<AguaData>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Water2.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(70.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 30.0),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'ID', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: dataEntradaController,
                  decoration: const InputDecoration(labelText: 'Data de Entrada', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: valorEntradaController,
                  decoration: const InputDecoration(labelText: 'Valor de Entrada', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: dataSaidaController,
                  decoration: const InputDecoration(labelText: 'Data de Saída', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                TextField(
                  controller: valorSaidaController,
                  decoration: const InputDecoration(labelText: 'Valor de Saída', labelStyle: TextStyle(color: Colors.greenAccent), border: OutlineInputBorder(), filled: true, fillColor: Colors.black87),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    String id = idController.text;
                    String dataEntrada = dataEntradaController.text;
                    String valorEntrada = valorEntradaController.text;
                    String dataSaida = dataSaidaController.text;
                    String valorSaida = valorSaidaController.text;
                    if (id.isEmpty || dataEntrada.isEmpty || valorEntrada.isEmpty || dataSaida.isEmpty || valorSaida.isEmpty) {
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
                      Agua agua = Agua(
                        id: id,
                        dataEntrada: dataEntrada,
                        dataSaida: dataSaida,
                        valorSaida: valorSaida,
                        valorEntrada: valorEntrada,
                      );

                      aguaData.adicionarAgua(agua);

                      idController.clear();
                      dataEntradaController.clear();
                      valorEntradaController.clear();
                      dataSaidaController.clear();
                      valorSaidaController.clear();
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
