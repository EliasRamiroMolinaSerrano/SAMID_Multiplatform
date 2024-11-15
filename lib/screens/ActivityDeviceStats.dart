import 'package:flutter/material.dart';
import 'package:samid_multiplatform/screens/menu.dart'; // Asegúrate de que el DrawerMenu esté en la carpeta widgets

class ActivityDeviceStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(navigateTo: (route) => Navigator.pushReplacementNamed(context, route)), // Usamos el DrawerMenu
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text('Estatus del dispositivo'),
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
                      color: Colors.red,  // El tint de la batería en rojo
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

class DrawerMenu extends StatelessWidget {
  final Function(String) navigateTo;

  DrawerMenu({required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/your_image.png'), // Ruta de la imagen
                ),
                SizedBox(width: 10), // Espacio entre la imagen y el nombre
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center, // Alinea el nombre verticalmente
                  children: [
                    Text(
                      'Samuel', // Nombre que aparecerá a la derecha de la imagen
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              navigateTo('/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Patients'),
            onTap: () {
              navigateTo('/patients_view');
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Weekly Analysis'),
            onTap: () {
              navigateTo('/weekly_analysis');
            },
          ),
          ListTile(
            leading: Icon(Icons.check),
            title: Text('Check Now'),
            onTap: () {
              navigateTo('/check_now');
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Health and Activity History'),
            onTap: () {
              navigateTo('/history');
            },
          ),
          ListTile(
            leading: Icon(Icons.devices),
            title: Text('Device Status'),
            onTap: () {
              navigateTo('/device_status');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout logic
            },
          ),
        ],
      ),
    );
  }
}
