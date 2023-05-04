import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductRepository {
  final _dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get('https://dummyjson.com/products');

    final productsResponse = (response.data['products'] as List);
    final result =
        productsResponse.map((e) => ProductModel.fromJson(e)).toList();

    return result;
  }
}
