import 'package:flutter/material.dart';
import 'package:seneca/presentation/screen/menu_screen.dart';

class LoguinScreen extends StatelessWidget {
  const LoguinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          false, //Inhabilita el botón del dispositivo para volver atrás
      child: Scaffold(
        body: Stack(
          children: [
            //Background
            const Background(),
            //Content
            Content(),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.8],
          colors: [Color(0xff005298), Color(0xff01315a)],
        ),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final inputDecorationUser = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      labelText: 'Usuario',
      labelStyle: const TextStyle(color: Colors.white),
    );
    final inputDecorationPassword = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      labelText: 'Contraseña',
      labelStyle: const TextStyle(color: Colors.white),
    );
    return SafeArea(
      child: Column(
        children: [
          // Titulo
          const TextoAplicacion(),
          const SizedBox(
              height: 20), // Espacio entre el título y los campos de entrada

          // Campos de entrada de texto
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: userController,
                  decoration: inputDecorationUser,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: inputDecorationPassword,
                  obscureText: true, // Para ocultar la contraseña
                ),
                const SizedBox(height: 16),

                // Botón de inicio de sesión
                ElevatedButton(
                  onPressed: () {
                    final user = userController.text;
                    final password = passwordController.text;
                    if (user == password) {
                      userController.clear();
                      passwordController.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuScreen()));
                    } else {
                      userController.clear();
                      passwordController.clear();
                    }
                  },
                  child: const Text('Entrar'),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text(
                  'No recuerdo mi contraseña',
                  style: TextStyle(
                    color: Colors
                        .white, // Puedes ajustar el color según tus preferencias
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child:
                  Container()), // Espacio entre los campos de entrada y el logo

          // Logo
          const LogoVersion(),
        ],
      ),
    );
  }
}

class TextoAplicacion extends StatelessWidget {
  const TextoAplicacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.05),
      child: const Text(
        "ISéneca",
        style: TextStyle(
          fontFamily: 'Arial',
          color: Colors.white,
          fontSize: 95,
          //fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LogoVersion extends StatelessWidget {
  const LogoVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: size.height * 0.3,
                width: size.width * 0.3,
                margin: EdgeInsets.only(
                    left: size.width * 0.3, right: size.width * 0.3),
                child: Image.asset(
                  "assets/iconoJunta.png",
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          //Versión
          Opacity(
            opacity: 0.15,
            child: Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.01, right: size.width * 0.03),
              alignment: Alignment.bottomRight,
              child: const Text("v11.3.0",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
