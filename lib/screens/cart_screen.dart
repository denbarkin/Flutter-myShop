import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart' show Cart;
import '../widgets/cart_item.dart';

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
      body: Column(children: [
        Card(
          color: Colors.amber[100],
          margin: const EdgeInsets.all(10),
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  const Spacer(
                    flex: 1,
                  ),
                  Chip(
                      label: Text(
                    '\$ ${cart.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w800),
                  )),
                  TextButton(onPressed: (() {}), child: const Text('ORDER NOW'))
                ],
              )),
        ),
        //Space for the header
        const SizedBox(
          height: 10,
        ),
        //Items in the Card
        Expanded(
          child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (BuildContext context, int index) {
              return CartItem(
                  id: cart.items.values.toList()[index].id,
                  title: cart.items.values.toList()[index].title,
                  quantity: cart.items.values.toList()[index].quantity,
                  price: cart.items.values.toList()[index].price);
            },
          ),
        )
      ]),
    );
  }
}
