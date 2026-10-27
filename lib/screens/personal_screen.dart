import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  static var persona = Persona(name: 'Guillem Gual', email: 'guillemgual@example.com', dateOfBirth: DateTime(2000, 6, 6));


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
  String name;
  String email;
  DateTime dateOfBirth;

  Persona({required this.name, required this.email, required this.dateOfBirth});

}