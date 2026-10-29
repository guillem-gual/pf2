import 'package:flutter/material.dart';

class PersonalScreen extends StatefulWidget {
  final Persona persona;

  const PersonalScreen({super.key, required this.persona});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _dateOfBirthController;

  DateTime? _dateOfBirth;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.persona.name);
    _emailController = TextEditingController(text: widget.persona.email);
    _passwordController = TextEditingController(text: widget.persona.password);

    _dateOfBirth = widget.persona.dateOfBirth;
    _dateOfBirthController = TextEditingController(text: _dateOfBirth != null
          ?
      "${_dateOfBirth!.day.toString().padLeft(2, '0')}/"
              "${_dateOfBirth!.month.toString().padLeft(2, '0')}/"
              "${_dateOfBirth!.year}"
          : '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: _dateOfBirth ?? DateTime(2000), 
      firstDate: DateTime(1900), 
      lastDate: DateTime.now()
    );

    if (picked != null){
      setState(() {
        _dateOfBirth = picked;

        _dateOfBirthController.text = "${picked.day.toString().padLeft(2, '0')}/"
            "${picked.month.toString().padLeft(2, '0')}/"
            "${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.persona.name.split(" ")[1]} - Edit Profile'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
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
                labelText: 'Password',
              ),
              obscureText: true,
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
  String password;
  DateTime dateOfBirth;

  Persona({required this.name, required this.email, required this.password, required this.dateOfBirth});

}