import 'package:cart/src/repository/product_repository.dart';

Future<void> main() async {
  final repository = ProductRepository();

  final products = await repository.getProducts();

  print(products);
}
