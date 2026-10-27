import 'package:flutter/material.dart';
import 'package:pf2/screens/personal_screen.dart';

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
            Text(PersonalScreen.persona.name),
            Text(PersonalScreen.persona.email),
            Text(PersonalScreen.persona.dateOfBirth.toString()),
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
