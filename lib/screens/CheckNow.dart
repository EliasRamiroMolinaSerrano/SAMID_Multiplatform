import 'package:flutter/material.dart';

class CheckNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 7,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Color(0xFFEBF5F7), // Primary_Light
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Paciente',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Manuel',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Image.asset(
                          'images/switch_ic.png', // Adjust image path
                          height: 24,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '44',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF03A9F4), // Primary_Normal
                              ),
                            ),
                            Text(
                              'LPM',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF0288D1), // Secondary_Darker
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '48',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF03A9F4),
                              ),
                            ),
                            Text(
                              'SPO2',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF0288D1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to WebsocketImplementation or trigger action
                        Navigator.pushNamed(context, '/websocket');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0288D1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        'Check Now',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Second Card
            _buildCard(
              context,
              title: 'Encuentra a tu paciente',
              description: 'SAMID rastrea a tus pacientes instantáneamente.',
              icon: 'images/location_pin_svgrepo_com.png', // Adjust path
              onTap: () {
                Navigator.pushNamed(context, '/map'); // MapActivity
              },
            ),

            // Third Card
            _buildCard(
              context,
              title: 'Configurar Alarmas',
              description:
              'Si el paciente necesita medicación, puedes programar alarmas con SAMID.',
              icon: 'images/clock.png', // Adjust path
              onTap: () {
                Navigator.pushNamed(context, '/alarms'); // AlarmActivity
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, {
        required String title,
        required String description,
        required String icon,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 7,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Color(0xFFEBF5F7),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Image.asset(
                  icon,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
