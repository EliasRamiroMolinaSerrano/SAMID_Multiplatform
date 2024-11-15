import 'package:flutter/material.dart';
import 'package:samid_multiplatform/constants/colors.dart';
import 'package:samid_multiplatform/screens/PatientsView.dart';
import 'package:samid_multiplatform/screens/ActivityDeviceStats.dart';
import 'package:samid_multiplatform/screens/menu.dart'; // Importamos el menú desde el archivo 'menu.dart'

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _navigateTo(String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(navigateTo: _navigateTo), // Usamos el CustomDrawer aquí
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _openDrawer,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hola, ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  'Samuel',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.verdoso,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              color: Color(0xFFB0EBEA),
              elevation: 7,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                height: 150,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.group,
                        size: 100,
                        color: AppColors.verdoso,
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: Container(
                        height: 35,
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(vertical: 1.1),
                        decoration: BoxDecoration(
                          color: AppColors.primaryNormal,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: ListTile(
                            title: Transform.translate(
                              offset: Offset(0, -6),
                              child: Text(
                                'Consultar Pacientes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                            trailing: Transform.translate(
                              offset: Offset(0, -6),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Activities',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 160,
                  height: 150,
                  child: Card(
                    color: Color(0xFFD3E2FB),
                    elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 1,
                            left: 1,
                            child: Text(
                              'Analisis semanal',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'montserrat_semi_bold',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'images/chart.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Card(
                    color: Color(0xFFF9F8E6),
                    elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      width: 160,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dispositivos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'montserrat_semi_bold',
                            ),
                          ),
                          SizedBox(height: 10),
                          Image.asset(
                            'images/pulsera.png',
                            width: 90,
                            height: 90,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeActivity(),
    routes: {
      '/home': (context) => HomeActivity(),
      '/PatientsView': (context) => PatientsView(),
      '/ActivityDeviceStats': (context) => ActivityDeviceStats(),
      // Otras rutas
    },
  ));
}
