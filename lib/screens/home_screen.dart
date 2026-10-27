import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevProfile M3'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(Persona.fullName),
            const Text(Persona.email),
            const Text(Persona.dateOfBirth),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/personal_screen.dart');
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
