import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repository/registrar_repository.dart';

class RegistrarPageLan extends StatefulWidget {
  const RegistrarPageLan({super.key, Key? chave});

  @override
  State<RegistrarPageLan> createState() => _RegistrarPageLanState();
}

class _RegistrarPageLanState extends State<RegistrarPageLan> {
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
                      Lan lan = Lan(
                        nome: nome,
                        rede: rede,
                        mac: mac,
                        ip: ip,
                        tipoAparelho: tipoAparelho,
                      );

                      lanData.adicionarLan(lan);

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
