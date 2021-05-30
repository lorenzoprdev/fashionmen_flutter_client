import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fashionmen_flutter_client/models/product.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.https('fashionmen.azurewebsites.net', '/api/products'));

    if(response.statusCode == 200) {
      return (json.decode(response.body) as List).map((el) => new Product.fromJson(el)).toList();
    } else {
      return null;
    }
  }
}