import 'dart:async';

import 'package:cart/src/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../commons/cart_controller.dart';
import '../../repository/product_repository.dart';

class HomeController implements Disposable {
  final ProductRepository repository;
  final CartController cartController;

  ValueNotifier<List<ProductModel>> products =
      ValueNotifier<List<ProductModel>>([]);

  HomeController({
    required this.repository,
    required this.cartController,
  });

  getProducts() async {
    products.value = await repository.getProducts();
  }

  addToCart(ProductModel product) {
    cartController.items.value.add(product);
    cartController.items.value = List.from(cartController.items.value);
  }

  @override
  FutureOr onDispose() {
    products.dispose();
  }
}
