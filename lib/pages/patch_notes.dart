import 'package:flutter/material.dart';
import 'services/build_expansion_tile.dart';

class PatchNotes extends StatefulWidget {
  const PatchNotes({super.key});

  @override
  State<PatchNotes> createState() => _PatchNotesState();
}

class _PatchNotesState extends State<PatchNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Patch Notes'), leading: const BackButton(), centerTitle: true, backgroundColor: const Color.fromARGB(255, 31, 29, 29)),
        body: Container(
          color: const Color.fromARGB(255, 31, 29, 29),
          child: ListView(children: [
            BuildExpansion.buildExpansionTile(title: 'Versão 1.0.0', icon: Icons.update, content: const Text('Versão de lançamento.\nPrimeira versão operacional do aplicativo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent))),
            BuildExpansion.buildExpansionTile(title: 'Versão 1.0.1', icon: Icons.update, content: const Text('Adicionado o modo Paisagem à tela de Login, assim resolvendo o bug que crashava o aplicativo ao girar a tela na página mencionada.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent))),
            BuildExpansion.buildExpansionTile(title: 'Versão 1.0.2', icon: Icons.update, content: const Text('Adicionado a página de Patch Notes em "Versão" da página "Sobre", que pode ser acessada através da HomePage', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent))),
            BuildExpansion.buildExpansionTile(title: 'Versão 1.0.3', icon: Icons.update, content: const Text('Adicionado a funcionalidade de rolagem infinita nas páginas de Consulta.\nReaproveitamento de dados em alguns campos na página de registrar consumo de água', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent))),
            BuildExpansion.buildExpansionTile(title: 'Versão 1.0.4', icon: Icons.update, content: const Text('Adicionado algumas personalizações na aba de autenticação via Biometria', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent))),
            BuildExpansion.buildExpansionTile(title: 'Versão 1.0.4.1', icon: Icons.update, content: const Text('Atualizado o plugin de Biometria da versão 1.1.6 para a 2.1.8', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.greenAccent))),
          ]),
        ));
  }
}
