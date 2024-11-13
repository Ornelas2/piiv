import 'package:flutter/material.dart';
import 'passwordalterada.dart'; // Importa a página de confirmação de alteração de password

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

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
              Color(0xFFA8A8A8), // Cinzento em baixo
              Color(0xFFFFFFFF), // Branco em cima
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
                'Criar nova password',
                style: TextStyle(
                  fontFamily: 'FuturaStd',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'A sua nova password tem de ser única!',
                style: TextStyle(
                  fontFamily: 'FuturaStd',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Color(0xFF8391A1),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _newPasswordController,
                obscureText: _obscureNewPassword, // Alternar entre mostrar e ocultar a password
                decoration: InputDecoration(
                  labelText: 'Nova password',
                  labelStyle: const TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureNewPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureNewPassword = !_obscureNewPassword; // Alternar o estado da password
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword, // Alternar entre mostrar e ocultar a password
                decoration: InputDecoration(
                  labelText: 'Confirmar password',
                  labelStyle: const TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword; // Alternar o estado da password
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordChangedPage()), // Navega para a página de confirmação de alteração de password
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 36), // Faz o botão ocupar a largura total
                  backgroundColor: Colors.yellow[700], // Define a cor do botão
                ),
                child: Text(
                  'Atualizar password',
                  style: TextStyle(
                    fontFamily: 'FuturaStd',
                    fontSize: 16,
                    color: Colors.black, // Define a cor do texto para preto
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
