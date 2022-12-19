import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/Cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: Column(
          children: [
            Card(
              color: Colors.amber[100],
              margin: const EdgeInsets.all(10),
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total'),
                      Text(
                        '${cart.totalPrice}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                      TextButton(
                          onPressed: (() {}), child: const Text('ORDER NOW'))
                    ],
                  )),
            )
          ],
        ));
  }
}
