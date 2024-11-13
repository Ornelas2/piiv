import 'package:flutter/material.dart';
import 'recuperar_password.dart'; // Importar a nova página
import 'paginainicial.dart'; // Importar a página inicial

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: 'FuturaStd', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'FuturaStd', fontWeight: FontWeight.normal),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true; // Variável para alternar entre mostrar e ocultar a password

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Move os widgets para cima
            crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'VIRIATOS SCOUTING ',
                      style: TextStyle(
                        fontFamily: 'FuturaStd',
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Diminuído para evitar overflow
                        color: Colors.black, // Define a cor do texto para preto
                      ),
                    ),
                    TextSpan(
                      text: 'dá-te as boas vindas!',
                      style: TextStyle(
                        fontFamily: 'FuturaStd',
                        fontWeight: FontWeight.normal,
                        fontSize: 18, // Diminuído para evitar overflow
                        color: Colors.black, // Define a cor do texto para preto
                      ),
                    ),
                  ],
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
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword, // Alternar entre mostrar e ocultar a password
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword; // Alternar o estado da password
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui os elementos entre as bordas
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 4), // Adicionado um espaçamento menor
                      const Text('Lembrar sessão', style: TextStyle(fontFamily: 'FuturaStd', fontSize: 14)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PasswordRecoveryPage()),
                      );
                    },
                    child: const Text('Esqueceu-se da password?', style: TextStyle(fontFamily: 'FuturaStd', fontSize: 14)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaginaInicial()), // Navega para a página inicial
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 36), // Faz o botão ocupar a largura total
                  backgroundColor: Colors.yellow[700], // Define a cor do botão
                ),
                child: Text('Iniciar Sessão', style: TextStyle(fontFamily: 'FuturaStd', fontSize: 16, color: Colors.black,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
