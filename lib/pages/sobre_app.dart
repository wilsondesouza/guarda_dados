import 'package:flutter/material.dart';
import 'package:guarda_dados/pages/home_page.dart';

class SobreNos extends StatefulWidget {
  const SobreNos({super.key});

  @override
  State<SobreNos> createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 29),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  foregroundColor: const Color.fromARGB(255, 31, 29, 29),
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/WSJlogo.png',
                    height: 150,
                  )),
            ],
          ),
          Expanded(flex: 4, child: Container()),
        ],
      ),
    ));
  }
}
