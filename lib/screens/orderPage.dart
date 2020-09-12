import 'package:flutter/material.dart';
import 'package:noob_shop/providers/orders.dart';
import 'package:noob_shop/widgets/customDrawer.dart';
import 'package:noob_shop/widgets/orderItem.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  static const routeName = '/order-page';
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text("Previous Orders")),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderItem(
          singleOrder: order.orderList[index],
        ),
        itemCount: order.orderCount,
      ),
    );
  }
}
