import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Importa TapGestureRecognizer
import 'novapassword.dart'; // Importa a página de reset de password

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
                'Verificação',
                style: TextStyle(
                  fontFamily: 'FuturaStd',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Insere o código de verificação que foi enviado para o teu email.',
                style: TextStyle(
                  fontFamily: 'FuturaStd',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Color(0xFF8391A1),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _controllers[index],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        counterText: '',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordPage()), // Navega para a página de reset de password
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 36), // Faz o botão ocupar a largura total
                  backgroundColor: Colors.yellow[700], // Define a cor do botão
                ),
                child: Text('Verificar', style: TextStyle(fontFamily: 'FuturaStd', fontSize: 16, color: Colors.black,)),
              ),
              const Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Não recebeu o código? ',
                        style: TextStyle(
                          fontFamily: 'FuturaStd',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'REENVIAR',
                        style: TextStyle(
                          fontFamily: 'FuturaStd',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.yellow[700],
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          // Implementa a lógica de reenvio do código aqui
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
