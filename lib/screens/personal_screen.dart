import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  static var persona = Persona(name: 'Guillem Gual', email: 'guillemgual@example.com', dateOfBirth: DateTime.now());


  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${PersonalScreen.persona.name} - Edit Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
              ),
            ),
          ],
        ),
    ));
  }
}

class Persona {
  String name = 'Guillem Gual';
  String email = 'guillemgual@example.com';
  DateTime dateOfBirth = DateTime.now();

  Persona({required this.name, required this.email, required this.dateOfBirth});

}