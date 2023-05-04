import 'dart:async';

import 'package:cart/src/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class CartController extends Disposable {
  ValueNotifier<List<ProductModel>> items =
      ValueNotifier<List<ProductModel>>([]);

  @override
  FutureOr onDispose() {
    items.dispose();
  }
}
