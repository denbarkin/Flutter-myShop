import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import '../providers/orders.dart';
import '../widgets/order_item.dart' as oi;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/order_screen';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) => oi.OrderListItem(
          order: orderData.orders[index],
        ),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
