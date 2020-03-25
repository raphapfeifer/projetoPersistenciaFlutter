
import 'package:bytebank/models/Transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/resources/constants.dart' as Constants;

class TransactionsList extends StatelessWidget {

  final List<Transaction> transactions = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.TITULO_TRANSACTION_FEED),
      ),
      body: ListView.builder(
          itemBuilder:(context,index){
            final Transaction transaction = transactions[index];
            return Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text(
                    transaction.value.toString(),
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    transaction.contact.accountNumber.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
            );
          },
          itemCount: transactions.length,
      ),
    );
  }
}

