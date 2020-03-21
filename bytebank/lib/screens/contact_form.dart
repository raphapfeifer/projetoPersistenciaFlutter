import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/Contact.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'New Contact';
const _labelFullName = 'Full name';
const _labelAccountNumber = 'Account Number';
const _createButton = 'Create';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: _labelFullName),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _accountNumberController,
                  decoration: InputDecoration(labelText: _labelAccountNumber),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text(_createButton),
                    onPressed: () {
                      final String name = _nameController.text;
                      final int accountNumber =
                          int.parse(_accountNumberController.text);
                      final Contact newContact =
                          Contact(0, name, accountNumber);
                      save(newContact).then((id) => Navigator.pop(context));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
