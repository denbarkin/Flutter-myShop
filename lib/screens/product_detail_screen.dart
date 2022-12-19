import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  static const routeName = "/product_detail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    // listen: false
    // if notifyListeners for Products called this object not redraw/build itself.
    //
    final Product? product =
        Provider.of<Products>(context, listen: false).findById((productId));

    return Scaffold(
      appBar: AppBar(title: Text(product?.title ?? "Not Found !!!")),
      body: Text('DetailPage ${product?.description ?? "N/A"}'),
    );
  }
}
