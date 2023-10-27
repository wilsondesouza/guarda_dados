import 'package:flutter/material.dart';

// Classe com uma função que gera os cards dinâmicamente.
class BuildExpansion {
  static buildExpansionTile({required String title, required IconData icon, required Widget content}) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ExpansionTile(
        backgroundColor: const Color.fromARGB(255, 31, 29, 29),
        collapsedTextColor: Colors.black87,
        leading: Icon(icon, size: 30),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          content,
        ],
      ),
    );
  }
}
