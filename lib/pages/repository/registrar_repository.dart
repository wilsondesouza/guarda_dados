// Repositório de registro das informações

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Classe com declaração das variáveis e um construtor, além de lista para percorrer e traduzir para Json para realizar a persistência de dados
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

// Funções para salvar e carregar os dados fornecidos
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
  return lanJson.map((lansJson) => Lan.fromJson(jsonDecode(lansJson))).toList();
}

// Classe com funções para adicionar e remover objetos na lista
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

// Classe com declaração das variáveis e um construtor, além de lista para percorrer e traduzir para Json para realizar a persistência de dados
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

// Funções para salvar e carregar os dados fornecidos
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

// Classe com funções para adicionar e remover objetos na lista
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
