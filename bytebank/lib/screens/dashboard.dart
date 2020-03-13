import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'DashBoard';
const _tituloContainer = 'Contacts';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/bytebank_logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ContactsList(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 100,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.people,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          Text(_tituloContainer,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
