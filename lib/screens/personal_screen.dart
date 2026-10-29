import 'package:flutter/material.dart';
import 'package:pf2/models/persona.dart';
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

  void _guardarITornar() {
    if (_formKey.currentState!.validate()){
      widget.persona.name = _nameController.text.trim();
      widget.persona.email = _emailController.text.trim();
      widget.persona.password = _passwordController.text.trim();
      widget.persona.dateOfBirth = _dateOfBirth!;

      Navigator.pop(context, widget.persona);
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
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Camp obligatori';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Camp obligatori';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Camp obligatori';
                }
                if (!value.contains('@')) {
                  return 'Email no vàlid';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _dateOfBirthController,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                suffixIcon: Icon(Icons.calendar_month),
              ),
              keyboardType: TextInputType.datetime,
              readOnly: true,
              onTap: _selectDate,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Camp obligatori';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _guardarITornar,
              child: const Text('Save and Return'),
            ),
          ],
        ),
      )
    );
  }
}