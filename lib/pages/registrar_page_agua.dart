import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repository/registrar_repository.dart';

class RegistrarPageAgua extends StatefulWidget {
  const RegistrarPageAgua({super.key, Key? chave});

  @override
  State<RegistrarPageAgua> createState() => _RegistrarPageAguaState();
}

class _RegistrarPageAguaState extends State<RegistrarPageAgua> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    TextEditingController dataEntradaController = TextEditingController();
    TextEditingController valorEntradaController = TextEditingController();
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

                      int idInt = int.parse(idController.text);
                      idInt++;
                      idController.text = "0$idInt";
                      dataEntradaController.text = dataSaidaController.text;
                      valorEntradaController.text = valorSaidaController.text;
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
