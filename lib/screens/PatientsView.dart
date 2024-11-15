import 'package:flutter/material.dart';
import 'package:samid_multiplatform/constants/colors.dart';
import 'package:samid_multiplatform/screens/menu.dart'; // Asegúrate de importar el menú

class PatientsView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Función para abrir el Drawer
  void _openDrawer(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Usamos la clave del Scaffold
      drawer: CustomDrawer(navigateTo: (route) => Navigator.pushReplacementNamed(context, route)), // Usamos el Drawer
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _openDrawer(context), // Función para abrir el menú
        ),
        title: Text('Pacientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pacientes',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 100),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 7,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/pulsera.png',
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(height: 8),
                        Image.asset(
                          'images/battery_low.png',
                          width: 40,
                          height: 40,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Manuel',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Diabetes',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/check_now');
                              },
                              child: Text('Checar'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(110, 50),
                                textStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/device_status');
                              },
                              child: Text('Aparato'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(110, 50),
                                textStyle: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Positioned(
              bottom: 50,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_patient');
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
