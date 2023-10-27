// Página de Login contendo acesso por usuário e senha, além de um método de acesso e validação por Biometria

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:guarda_dados/pages/home_page.dart';
import 'services/auth_provider.dart';
import 'services/social_media.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");

  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 29),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset('assets/WSJlogo.png', width: 200),
                  const SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(contentPadding: EdgeInsets.only(top: -6), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)), hintText: "Usuário", hintStyle: TextStyle(color: Colors.white, fontSize: 20), prefixIcon: Icon(Icons.email, color: Colors.greenAccent)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      obscureText: isObscured,
                      controller: passwordController,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: -6),
                          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          hintText: "Senha",
                          hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
                          prefixIcon: const Icon(Icons.lock, color: Colors.greenAccent),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscured = !isObscured;
                                });
                              },
                              child: Icon(isObscured ? Icons.visibility_off : Icons.visibility, color: Colors.white))),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (emailController.text.trim() == "admin" && passwordController.text.trim() == "admin") {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao efetuar o login")));
                      }
                    },
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(350, 40)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 190),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () async {
                          await SocialMedia.launch();
                        },
                        backgroundColor: Colors.greenAccent,
                        child: Image.asset('assets/linktree.png', width: 55.0, height: 55.0),
                      ),
                      const SizedBox(width: 150),
                      FloatingActionButton(
                        onPressed: () async {
                          final isAuthenticated = await LocalAuthApi.authenticate();
                          if (isAuthenticated) {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                          }
                        },
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.black,
                        child: const Icon(Icons.fingerprint),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
