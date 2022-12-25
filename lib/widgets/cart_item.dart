import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;
  const CartItem(
      {super.key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: ValueKey(id),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            Provider.of<Cart>(context, listen: false).removeItem(id);
          }
        },
        background: Container(
            // ignore: sort_child_properties_last
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 35,
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 15),
            color: Theme.of(context).errorColor),
        child: Card(
            child: ListTile(
          leading: CircleAvatar(
              child: FittedBox(
                  child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              '\$$price',
            ),
          ))),
          title: Text(title),
          subtitle: Text('Total : \$${price * quantity}'),
          trailing: Text('x $quantity'),
        )),
      ),
    );
  }
}
