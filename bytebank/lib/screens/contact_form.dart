import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/Contact.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/resources/constants.dart' as Constants;

//const _tituloAppBar = 'New Contact';
//const _labelFullName = 'Full name';
//const _labelAccountNumber = 'Account Number';
//const _createButton = 'Create';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.TITULO_NEW_CONTACT),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: Constants.LABEL_FULL_NAME),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _accountNumberController,
                  decoration: InputDecoration(labelText: Constants.LABEL_ACCOUNT_NUMBER),
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
                    child: Text(Constants.CREATE_BUTTON),
                    onPressed: () {
                      final String name = _nameController.text;
                      final int accountNumber =
                          int.parse(_accountNumberController.text);
                      final Contact newContact =
                          Contact(0, name, accountNumber);
                      _dao.save(newContact).then((id) => Navigator.pop(context));
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
