import 'package:flutter/material.dart';
import 'package:samid_multiplatform/constants/colors.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late WebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    channel = WebSocketChannel.connect(Uri.parse('ws://192.168.0.116:8081'));
    channel.stream.listen((message) {
      print('Mensaje recibido: $message');
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100), // Logo SAMID más abajo
              // Logo SAMID
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SAM',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 50,
                      color: Color(0xFF47C5C2), // Color verdoso
                    ),
                  ),
                  Text(
                    'ID',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 50,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Crea tu cuenta',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50),
              // Input fields con el mismo estilo que MainScreen
              _buildTextField(hintText: 'Nombre'),
              SizedBox(height: 16),
              _buildTextField(hintText: 'Apellido'),
              SizedBox(height: 16),
              _buildTextField(hintText: 'Email'),
              SizedBox(height: 16),
              _buildTextField(hintText: 'Contraseña', obscureText: true),
              SizedBox(height: 24),
              // Botón de registrar
              ElevatedButton(
                onPressed: () {
                  print('Formulario enviado!');
                },
                child: Text(
                  'Registrar',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.verdoso, // Color verdoso
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Texto para usuarios existentes
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '¿Ya tienes una cuenta?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para crear los campos de texto con el estilo de MainScreen
  Widget _buildTextField({required String hintText, bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE3F2F1), // Fondo con el color Primary_Light
        borderRadius: BorderRadius.circular(20), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3), // Sombra hacia abajo
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: AppColors.primaryLight, // Color de fondo del campo
          border: InputBorder.none, // Elimina el borde por defecto
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
