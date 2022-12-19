import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import 'package:shopapp/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    print('+++ Detech number of times call isFavorite product calls;');

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          // Consumer Widget allows only this part of widget builds each time notifyListerer methods call.
          // Imported Widgets : Consumer
          trailing: Consumer<Product>(
            builder: (context, product, child) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                focusColor: Theme.of(context).backgroundColor,
                onPressed: (() {
                  product.toggleFavorite();
                }),
                color: Colors.red),
          ),
          leading: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              return;
            },
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetail.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
