import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  static var persona = Persona(name: 'Guillem Gual', email: 'guillemgual@example.com', dateOfBirth: DateTime(2000, 6, 6));


  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${PersonalScreen.persona.name.split(" ")[1]} - Edit Profile'),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          spacing: 10.0,
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
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
              ),
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
      )
    );
  }
}

class Persona {
  String name;
  String email;
  DateTime dateOfBirth;

  Persona({required this.name, required this.email, required this.dateOfBirth});

}