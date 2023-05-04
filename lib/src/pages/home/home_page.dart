import 'package:cart/src/getit_manager.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = getIt<HomeController>();
  @override
  void initState() {
    super.initState();
    controller.getProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
      ),
      body: Column(
        children: [
          const Text('Lista de Produtos'),
          Expanded(
            child: ValueListenableBuilder<List<ProductModel>>(
                valueListenable: controller.products,
                builder: (_, products, __) {
                  if (products.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return InkWell(
                        onTap: () {
                          controller.addToCart(product);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(product.image),
                              Text(product.description),
                              Text(product.price.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: ValueListenableBuilder<List<ProductModel>>(
          valueListenable: controller.cartController.items,
          builder: (_, cart, __) {
            return CircleAvatar(
              child: Text(cart.length.toString()),
            );
          }),
    );
  }
}
