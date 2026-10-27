import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  static get persona => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${PersonalScreen.persona.name} - Edit Profile'),
      ),
      body: const Center(
        child: Text('This is the personal screen.'),
      ),
    );
  }
}

class Persona {
  String name;
  String email;
  DateTime dateOfBirth;

  Persona({required this.name, required this.email, required this.dateOfBirth});

}