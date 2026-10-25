import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ApiService {
  static const _baseUrl =
      'https://fakestoreapi.com/products/category/electronics';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // API ini mengembalikan array JSON langsung (bukan Map)
        final List<dynamic> productsJson = jsonDecode(response.body);
        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
