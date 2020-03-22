import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/resources/constants.dart' as Constants;


class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Constants.TITULO_DASHBOARD),
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
              Row(
                children: <Widget>[
                  _FeatureItem(Constants.TITULO_TRANSFER,Icons.monetization_on),
                  _FeatureItem(Constants.TITULO_TRANSACTION_FEED,Icons.description),
                ],
              ),
            ],
          ),
        ));
  }
}

class _FeatureItem extends StatelessWidget {

  final String name;
  final IconData icon;

  _FeatureItem(this.name,this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
