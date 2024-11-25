import 'package:flutter/material.dart';

class ActivityHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('History Activity'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Patients View'),
              onTap: () {
                Navigator.pushNamed(context, '/patients');
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Weekly Analysis'),
              onTap: () {
                Navigator.pushNamed(context, '/weekly_analysis');
              },
            ),
            ListTile(
              leading: Icon(Icons.check_circle),
              title: Text('Check Now'),
              onTap: () {
                Navigator.pushNamed(context, '/check_now');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Device Status'),
              onTap: () {
                Navigator.pushNamed(context, '/device_status');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Implementar acción de logout
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildCard(
              context,
              title: 'Llamadas',
              icon: Icons.phone,
              onTap: () {
                Navigator.pushNamed(context, '/history_calls');
              },
            ),
            buildCard(
              context,
              title: 'Resultados',
              icon: Icons.bar_chart,
              onTap: () {
                Navigator.pushNamed(context, '/history_results');
              },
            ),
            buildCard(
              context,
              title: 'Ubicaciones',
              icon: Icons.location_on,
              onTap: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
            buildCard(
              context,
              title: 'Caídas',
              icon: Icons.warning,
              onTap: () {
                Navigator.pushNamed(context, '/history_falls');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final Color verdoso = Color(0xFFB2FF59); // Reemplaza con tu color de constants si ya está definido

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: verdoso,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 100, // Altura de 100 px
          child: ListTile(
            leading: Icon(
              icon,
              size: 50,
              color: Colors.black54,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
