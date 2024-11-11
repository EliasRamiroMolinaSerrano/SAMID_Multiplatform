import 'package:flutter/material.dart';
import 'package:samid_multiplatform/constants/colors.dart';
import 'package:samid_multiplatform/screens/PatientsView.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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
                      // Si necesitas un subtítulo debajo del nombre, agrégalo aquí
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
              leading: Icon(Icons.home), // Replace with your custom icon
              title: Text(
                'Inicio',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              onTap: () => _navigateTo('/home'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text(
                'Pacientes',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              onTap: () {
                // Navegar a PatientsView
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PatientsView(), // Asegúrate de que esta sea la vista correcta
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today), // Replace with your custom icon
              title: Text(
                'Análisis semanal',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              onTap: () => _navigateTo('/weekly_analysis'),
            ),
            ListTile(
              leading: Icon(Icons.healing), // Replace with your custom icon
              title: Text(
                'Checar ahora',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              onTap: () => _navigateTo('/check_now'),
            ),
            ListTile(
              leading: Icon(Icons.history), // Replace with your custom icon
              title: Text(
                'Historial de salud y actividad',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              onTap: () => _navigateTo('/history'),
            ),
            ListTile(
              leading: Icon(Icons.devices), // Replace with your custom icon
              title: Text(
                'Estado del dispositivo',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              onTap: () => _navigateTo('/device_status'),
            ),
            Divider(), // Divider for logout section
            ListTile(
              leading: Icon(Icons.exit_to_app), // Replace with your custom icon
              title: Text(
                'Salir de la cuenta',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              onTap: () => _navigateTo('/logout'),
            ),
          ],
        ),
      ),
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
                    fontFamily: 'Montserrat', // Aplica Montserrat
                  ),
                ),
                Text(
                  'Samuel',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.verdoso,
                    fontFamily: 'Montserrat', // Aplica Montserrat
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
                height: 150, // Ajusta la altura de la tarjeta
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.group,
                        size: 100,
                        color: AppColors.verdoso,
                      ), // Icono grande
                    ),
                    SizedBox(
                      width: 220, // Ancho fijo del contenedor
                      child: Container(
                        height: 35, // Ajusta la altura del contenedor
                        margin: EdgeInsets.only(bottom: 10), // Agrega margen inferior
                        padding: EdgeInsets.symmetric(vertical: 1.1),
                        decoration: BoxDecoration(
                          color: AppColors.primaryNormal,
                          borderRadius: BorderRadius.circular(15.0), // Radio del borde
                          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: ListTile(
                            title: Transform.translate(
                              offset: Offset(0, -6), // Mueve el texto hacia arriba
                              child: Text(
                                'Consultar Pacientes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  fontFamily: 'Montserrat', // Aplica Montserrat
                                ),
                              ),
                            ),
                            trailing: Transform.translate(
                              offset: Offset(0, -6), // Mueve la flecha hacia arriba
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
                fontFamily: 'Montserrat', // Aplica Montserrat
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 160, // Ancho fijo del contenedor
                  height: 150, // Altura fija del contenedor
                  child: Card(
                    color: Color(0xFFD3E2FB),
                    elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 1, // Ajusta la posición vertical
                            left: 1, // Ajusta la posición horizontal
                            child: Text(
                              'Analisis semanal',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'montserrat_semi_bold', // Aplica Montserrat
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
                    color: Color(0xFFF9F8E6), // Color F9F8E6
                    elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      width: 160, // Ancho fijo del contenedor (igual que Weekly Analysis)
                      height: 150, // Altura fija del contenedor (igual que Weekly Analysis)
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
                        children: [
                          Text(
                            'Dispositivos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'montserrat_semi_bold', // Aplica Montserrat
                            ),
                            textAlign: TextAlign.left, // Alinea el texto al centro
                          ),
                          SizedBox(height: 10), // Espacio entre el texto y la imagen
                          Image.asset(
                            'images/pulsera.png', // Ruta de la imagen
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
      '/PatientsView': (context) => PatientsView(), // Asegúrate de que la ruta esté correcta

    },
  ));
}
