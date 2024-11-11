import 'package:flutter/material.dart';

class PatientsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, size: 30, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop(); // Cerrar el Drawer
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Patients'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/patients_view');
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Weekly Analysis'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/weekly_analysis');
              },
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Check Now'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/check_now');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Health and Activity History'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/history');
              },
            ),
            ListTile(
              leading: Icon(Icons.devices),
              title: Text('Device Status'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/device_status');
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
      ),
      appBar: AppBar(
        title: Text('Patients'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
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
                          'assets/images/pulsera.png',
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(height: 8),
                        Image.asset(
                          'assets/images/battery_svg.png',
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
