import 'dart:convert';

import 'package:bytebank/models/Transaction.dart';
import 'package:http/http.dart';

import '../webclient.dart';

class TransactionWebClient {

  Future<List<Transaction>> findAll() async {
    final Response response =
    await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    // a mesma coisa que a expressão final do return
    /*final List<Transaction> transactions = List();
    for (Map<String, dynamic> transactionJson in decodedJson) {
        transactions.add(Transaction.fromJson(transactionJson));
    }*/
    return decodedJson.map((dynamic json)=> Transaction.fromJson(json)).toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl, headers: {
      'Content-type': 'application/json',
      'password': '1000',
    }, body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }

}