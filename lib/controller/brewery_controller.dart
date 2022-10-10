import 'dart:convert';
import 'package:maheey_task/model/Brewery.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<Brewery> productList = [];
  Future<List<Brewery>> getProducts() async {
    final response =
        await http.get(Uri.parse("https://api.openbrewerydb.org/breweries"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print("Data Submitted");
      for (Map i in data) {
        // print(i["name"]);
        productList.add(Brewery.fromJson(i));
        // print("Device Names : ${productList}");
      }
      return productList;
    } else {
      return productList;
    }
  }
}
