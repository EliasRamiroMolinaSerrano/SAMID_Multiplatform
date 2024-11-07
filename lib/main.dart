import 'package:flutter/material.dart';
import 'screens/registration_page.dart';  // Asegúrate de importar la página de registro
import 'constants/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

              // "Sign in to your account" text with marginBottom
              Text(
                "Inicia sesión en tu cuenta",
                style: TextStyle(fontFamily: 'montserrat_regular', fontSize: 12),
              ),
              SizedBox(height: 50), // Margin between the text and the input fields

              // Username input
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryLight, // Fondo con color Primary_Light
                  borderRadius: BorderRadius.circular(20), // Más redondeado
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3), // Sombra hacia abajo
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.primaryLight, // Fondo del campo
                    border: InputBorder.none, // Elimina el borde por defecto
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              SizedBox(height: 16), // Separación entre los campos de texto

              // Password input
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryLight, // Fondo con color Primary_Light
                  borderRadius: BorderRadius.circular(20), // Más redondeado
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3), // Sombra hacia abajo
                    ),
                  ],
                ),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.primaryLight, // Fondo del campo
                    border: InputBorder.none, // Elimina el borde por defecto
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),

              // "Forgot Password?" text
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Olvidaste tu contraseña?",
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 14),
                ),
              ),

              // Login button
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la página de registro
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60),
                  backgroundColor: AppColors.verdoso, // Replace with your color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Iniciar sesión",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: "montserrat_bold"),
                ),
              ),

              // Horizontal lines and "Sign up with" text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness: 2)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Inicia sesión con"),
                    ),
                    Expanded(child: Divider(thickness: 2)),
                  ],
                ),
              ),

              // Social login buttons (Fixed width)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Facebook Button
                  SizedBox(
                    width: 150, // Cambia el ancho de este botón (Facebook)
                    child: socialButton('facebook_logo.png', 'Facebook'),
                  ),
                  SizedBox(width: 10), // Espacio entre los botones
                  // Google Button
                  SizedBox(
                    width: 150, // Cambia el ancho de este botón (Google)
                    child: socialButton('google_logo.png', 'Google'),
                  ),
                ],
              ),

              // "Don't have an account?" and "Sign up" texts
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No tienes una cuenta?"),
                  TextButton(
                    onPressed: () {
                      // Handle registration navigation
                    },
                    child: Text(
                      "Regístrate",
                      style: TextStyle(color: AppColors.verdoso),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton(String imagePath, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido dentro del botón
        children: [
          Image.asset(
            'assets/images/$imagePath', // Corrected asset path
            width: 24,
            height: 24,
          ),
          SizedBox(width: 8),
          Text(text, style: TextStyle(fontFamily: 'Montserrat')),
        ],
      ),
    );
  }
}
