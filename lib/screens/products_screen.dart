import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/widgets/user_product_item.dart';
import '../providers/products.dart';
import '../widgets/app_drawer.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/Products_Screen';

  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [IconButton(onPressed: (() {}), icon: const Icon(Icons.add))],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return UserProductItem(
              title: products.items[index].title,
              imageUrl: products.items[index].imageUrl);
        },
        itemCount: products.items.length,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
