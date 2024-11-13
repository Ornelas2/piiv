import 'package:flutter/material.dart';
import 'codigo.dart'; // Importar a página de verificação
import 'package:flutter/gestures.dart'; // Importa TapGestureRecognizer

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  _PasswordRecoveryPageState createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Esqueceste-te da password?',
                style: TextStyle(
                  fontFamily: 'FuturaStd',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Não te preocupes! Acontece. Por favor insere o email associado à tua conta.',
                style: TextStyle(
                  fontFamily: 'FuturaStd',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Color(0xFF8391A1),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerificationPage()), // Navega para a página de verificação
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 36), // Faz o botão ocupar a largura total
                  backgroundColor: Colors.yellow[700], // Define a cor do botão
                ),
                child: Text('Enviar código', style: TextStyle(fontFamily: 'FuturaStd', fontSize: 16, color: Colors.black,)),
              ),
              const Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Lembra-se da password? ',
                        style: TextStyle(
                          fontFamily: 'FuturaStd',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'LOGIN',
                        style: TextStyle(
                          fontFamily: 'FuturaStd',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.yellow[700],
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pop(context); // Volta para a página de login
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
