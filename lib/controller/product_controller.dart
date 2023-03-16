import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/company_model.dart';
import '../models/product_model.dart';

class ProductController {
  Future<List<Product>> getProductsByCompanyId(Company company) async {
    final url = Uri.parse('https://doitall.com.br/api/product/index');
    final body = {
      'company_id': company.id.toString(),
    };
    final response = await http.put(url, body: body);
    final json = jsonDecode(response.body);

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
