import 'dart:convert';

import 'package:bytebank/models/Transaction.dart';
import 'package:http/http.dart';

import '../webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    // a mesma coisa que a expressão final do return
    /*final List<Transaction> transactions = List();
    for (Map<String, dynamic> transactionJson in decodedJson) {
        transactions.add(Transaction.fromJson(transactionJson));
    }*/
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }else{
      return 'Uknow error';
    }
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'Thre was an error submitting transaction',
    401: 'Authentication failed',
    409: 'Transaction always exists'
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
