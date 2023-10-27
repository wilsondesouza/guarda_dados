// Página "Sobre" acessada por meio de um Drawer na HomePage

import 'package:flutter/material.dart';
import 'package:guarda_dados/pages/patch_notes.dart';
import 'package:guarda_dados/pages/services/build_expansion_tile.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sobre o App'),
          leading: const BackButton(),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 31, 29, 29),
        ),
        body: Container(
          color: const Color.fromARGB(255, 31, 29, 29),
          child: ListView(
            children: [
              BuildExpansion.buildExpansionTile(
                title: 'O que é o Guarda Dados?',
                icon: Icons.info_outline,
                content: const Text(
                  'Desenvolvido para registrar informações.\n\nPor se tratar de informações sensíveis, um sistema de login com etapa de segurança via Biometria foi implementada.\n\nE para que não se percam com o encerramento ou reinicio do aplicativo, foi implementada uma Persistência de Dados',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                ),
              ),
              BuildExpansion.buildExpansionTile(
                title: 'Funcionalidades',
                icon: Icons.list_alt,
                content: const Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.check_circle_outline_rounded),
                      iconColor: Colors.blue,
                      title: Text(
                        'Sistema de Login',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle_outline_rounded),
                      iconColor: Colors.blue,
                      title: Text(
                        'Segurança por Biometria',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle_outline_rounded),
                      iconColor: Colors.blue,
                      title: Text(
                        'Registra e Consulta informações',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle_outline_rounded),
                      iconColor: Colors.blue,
                      title: Text(
                        'Persiste dados em armazenamento local',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                      ),
                    ),
                  ],
                ),
              ),
              BuildExpansion.buildExpansionTile(
                title: 'Desenvolvedores',
                icon: Icons.people_outline,
                content: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text(
                        'Wilson Souza',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                      ),
                      subtitle: Text(
                        'wilson.de.souza.junior@gmail.com',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                      ),
                    ),
                  ],
                ),
              ),
              BuildExpansion.buildExpansionTile(
                title: 'Versão',
                icon: Icons.update,
                content: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Versão ${snapshot.data?.version}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const PatchNotes()));
                            },
                            child: const Text("Ver Patch Notes "),
                          )
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              BuildExpansion.buildExpansionTile(
                title: 'Termos de uso',
                icon: Icons.gavel,
                content: const Text(
                  'O aplicativo é uma ferramenta que permite ao usuário criar, gerenciar e consultar bancos de dados de forma simples e intuitiva.\n\nO usuário é o único responsável pelo acesso e uso do aplicativo de banco de dados, bem como pelos conteúdos e dados que inserir, armazenar ou consultar no aplicativo.\n\nAo desinstalar o aplicativo, o usuário perderá o acesso aos conteúdos e dados inseridos, armazenados ou consultados.\n\nO Aplicativo e todo o seu conteúdo, incluindo, mas não se limitando a, texto, gráficos, logotipos, ícones e imagens são propriedade exclusiva do desenvolvedor.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
