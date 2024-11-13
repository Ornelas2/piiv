import 'package:flutter/material.dart';
import 'main.dart'; // Importa a página de login

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: null,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFA8A8A8), // Cinzento em cima
                  Color(0xFFFFFFFF), // Branco em baixo
                ],
              ),
            ),
          ),
          elevation: 0,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFFA8A8A8),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.yellow[700],
                  size: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Password alterada',
                  style: TextStyle(
                    fontFamily: 'FuturaStd',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'A sua password foi alterada com sucesso.',
                  style: TextStyle(
                    fontFamily: 'FuturaStd',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xFF8391A1),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 36), // Faz o botão ocupar a largura total
                    backgroundColor: Colors.yellow[700], // Define a cor do botão
                  ),
                  child: Text('Voltar ao login', style: TextStyle(fontFamily: 'FuturaStd', fontSize: 16, color: Colors.black,)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
