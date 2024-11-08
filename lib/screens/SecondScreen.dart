import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is the second screen',
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the first screen when the button is pressed.
                Navigator.pop(context);
              },
              child: const Text('Go Back!'),
            ),
          ],
        ),
      ),
    );
  }
}
