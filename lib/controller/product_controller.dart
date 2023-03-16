import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductController {
  static const String baseUrl = 'https://doitall.com.br/api/product';

  Future<List<Product>> getProductsByCompanyId(String companyId) async {
    final url = Uri.parse('$baseUrl/index?company_id=$companyId');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['products'];
      final List<Product> products =
          responseData.map((data) => Product.fromJson(data)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
