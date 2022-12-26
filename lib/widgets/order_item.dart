import 'package:flutter/material.dart';
import '../providers/orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderListItem extends StatefulWidget {
  final OrderItem order;
  const OrderListItem({super.key, required this.order});

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _showDetail = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)),
            leading: IconButton(
              icon: Icon((_showDetail ? Icons.expand_less : Icons.expand_more)),
              onPressed: () {
                _showDetail = !_showDetail;
              },
            ),
          ),
          if (_showDetail)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.order.products[index].title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          '${widget.order.products[index].quantity} x \$${widget.order.products[index].price}'),
                    ],
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
