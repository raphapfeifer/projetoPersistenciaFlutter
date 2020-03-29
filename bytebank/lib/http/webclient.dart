

import 'package:http/http.dart';

void findAll() async {
  final Response response = await get("http://192.168.15.33:8080/transactions");
}