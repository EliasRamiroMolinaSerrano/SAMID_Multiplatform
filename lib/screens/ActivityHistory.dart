import 'package:flutter/material.dart';
import 'package:samid_multiplatform/constants/colors.dart';
import 'package:samid_multiplatform/screens/menu.dart'; // Importamos el CustomDrawer

class ActivityHistory extends StatefulWidget {
  @override
  _ActivityHistoryState createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
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
      drawer: CustomDrawer(navigateTo: _navigateTo), // Usamos el mismo CustomDrawer
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _openDrawer,
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
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: Color(0xFFE3F2FD), // Usamos el color definido en constants
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 100, // Altura del card
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Alinea verticalmente al centro
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.black54,
              ),
              SizedBox(width: 20), // Espacio entre el ícono y el texto
              Expanded( // Permite que el texto ocupe todo el espacio restante
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
