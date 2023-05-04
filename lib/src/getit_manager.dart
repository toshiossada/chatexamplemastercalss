import 'package:get_it/get_it.dart';

import 'commons/cart_controller.dart';
import 'pages/home/home_controller.dart';
import 'repository/product_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(ProductRepository());
  getIt.registerSingleton(CartController());
  getIt.registerSingleton(HomeController(
    repository: getIt<ProductRepository>(),
    cartController: getIt<CartController>(),
  ));
}
