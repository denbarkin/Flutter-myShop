import 'package:flutter/material.dart';
import 'package:shopapp/widgets/product_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({super.key});

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
                    if (selectedfilter == FilterOptions.Favorites) {
                      _showFav = true;
                    } else {
                      _showFav = false;
                    }
                  });
                },
                icon: const Icon(Icons.anchor_rounded),
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          value: FilterOptions.Favorites,
                          child: const Text('Only Favorites')),
                      //Divider(height: 10, thickness: 10, color: Colors.green),
                      const PopupMenuItem(
                        value: FilterOptions.All,
                        child: Text('Show All'),
                      )
                    ])
          ],
        ),
        body: Center(
            child: ProductsGrid(
          showFavs: _showFav,
        )));
  }
}