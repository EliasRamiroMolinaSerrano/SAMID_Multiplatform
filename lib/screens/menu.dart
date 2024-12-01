import 'package:flutter/material.dart';
import 'package:samid_multiplatform/screens/PatientsView.dart';
import 'package:samid_multiplatform/screens/ActivityDeviceStats.dart'; // Asegúrate de tener la ruta correcta
import 'package:samid_multiplatform/constants/colors.dart';
import 'package:samid_multiplatform/screens/CheckNow.dart';
import 'package:samid_multiplatform/screens/ActivityHistory.dart';



class CustomDrawer extends StatelessWidget {
  final Function(String) navigateTo;

  CustomDrawer({required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.verdoso,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/vegetta.png'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Samuel',
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
            title: Text('Inicio', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () => navigateTo('/home'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Pacientes', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PatientsView(), // Redirige a PatientsView
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Análisis semanal', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () => navigateTo('/weekly_analysis'),
          ),
          ListTile(
            leading: Icon(Icons.healing),
            title: Text('Checar ahora', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CheckNow(), // Redirige a PatientsView
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Historial de salud y actividad', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ActivityHistory(), // Redirige a PatientsView
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.devices),
            title: Text('Estado del dispositivo', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () {
              // Aquí usamos el Navigator para ir a la pantalla de estado del dispositivo
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ActivityDeviceStats(), // Redirige a ActivityDeviceStats
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir de la cuenta', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () => navigateTo('/logout'),
          ),
        ],
      ),
    );
  }
}
