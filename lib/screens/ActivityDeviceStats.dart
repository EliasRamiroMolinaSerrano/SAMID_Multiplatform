import 'package:flutter/material.dart';
import 'package:samid_multiplatform/screens/menu.dart'; // Asegúrate de que CustomDrawer esté importado correctamente
import 'package:samid_multiplatform/constants/colors.dart';

class ActivityDeviceStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        navigateTo: (route) => Navigator.pushReplacementNamed(context, route),
      ), // Usamos el CustomDrawer
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Estatus del dispositivo',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Color(0xFFE3F2FD), // Color similar a Primary_Light
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Monitor de comportamiento',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'SAMID Bracelet V2.1',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'images/pulsera.png', // Ruta de la imagen del brazalete
                      width: 220,
                      height: 220,
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'images/battery_low.png', // Ruta de la imagen de batería
                      width: 50,
                      height: 50,
                      color: Colors.red, // El tint de la batería en rojo
                    ),
                    SizedBox(height: 20),
                    Text(
                      '¿Has tenido dificultades con el dispositivo?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
