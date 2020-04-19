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

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl, headers: {
      'Content-type': 'application/json',
      'password': password,
    }, body: transactionJson);

    if(response.statusCode == 400){
      throw Exception('Thre was an error submitting transaction');
    }

    if(response.statusCode == 401){
      throw Exception('Authentication failed');
    }


    return Transaction.fromJson(jsonDecode(response.body));
  }

}