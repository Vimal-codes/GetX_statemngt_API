import 'dart:convert';

import 'package:getx_ststemngt_api/model/GetProducts.dart';
import 'package:getx_ststemngt_api/model/Products.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final baseUrl = "https://dummyjson.com";

  Future<List<Products>?> GetProductData() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if(response.statusCode >= 200 && response.statusCode <= 299){
      var jsonn = jsonDecode(response.body);
      var res = GetProducts.fromJson(jsonn);
      var plist = res.products;
      return plist;
    }
  }
}