
import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/Transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/resources/constants.dart' as Constants;

class TransactionsList extends StatelessWidget {

  final TransactionWebClient _webClient = TransactionWebClient();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.TITULO_TRANSACTION_FEED),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _webClient.findAll(),
        builder:(context,snapshot){

          switch(snapshot.connectionState){

            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if(snapshot.hasData){
                final List<Transaction> transactions = snapshot.data;
                if(transactions.isNotEmpty){
                  return  ListView.builder(
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
                  );
                }
              }
              return CenteredMessage(Constants.NO_TRANSACTIONS,icon: Icons.warning);
              break;
          }
          return CenteredMessage(Constants.UNKNOW_ERROR);
        },
      ),
    );
  }
}

