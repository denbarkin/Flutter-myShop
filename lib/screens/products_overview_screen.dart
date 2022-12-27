import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/badge.dart';
import 'package:shopapp/widgets/product_grid.dart';
import '../providers/Cart.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('myShop'),
          actions: [
            PopupMenuButton(
                onSelected: (FilterOptions selectedfilter) {
                  setState(() {
                    if (selectedfilter == FilterOptions.favorites) {
                      _showFav = true;
                    } else {
                      _showFav = false;
                    }
                  });
                },
                icon: const Icon(Icons.anchor_rounded),
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          value: FilterOptions.favorites,
                          child: Text('Only Favorites')),
                      //Divider(height: 10, thickness: 10, color: Colors.green),
                      const PopupMenuItem(
                        value: FilterOptions.all,
                        child: Text('Show All'),
                      )
                    ]),
            Consumer<Cart>(
                builder: (_, cart, nu) => Badge(
                    value: cart.itemCount.toString(),
                    color: Colors.orange,
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                    )))
          ],
        ),
        drawer: const AppDrawer(),
        body: Center(
            child: ProductsGrid(
          showFavs: _showFav,
        )));
  }
}
