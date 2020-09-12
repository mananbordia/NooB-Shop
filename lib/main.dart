import "package:flutter/material.dart";
import 'package:noob_shop/providers/cart.dart';
import 'package:noob_shop/providers/orders.dart';
import 'package:noob_shop/providers/products.dart';
import 'package:noob_shop/screens/cartPage.dart';
import 'package:noob_shop/screens/orderPage.dart';
import 'package:provider/provider.dart';
import './screens/productDetailPage.dart';
import 'package:noob_shop/screens/productHomePage.dart';

void main() => runApp(MyShop());

class MyShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Wrapping the highest widget in tree that wants Multiple providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          builder: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          builder: (ctx) => Order(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: ThemeData(
              primarySwatch: Colors.indigo, accentColor: Colors.black),
          routes: {
            '/': (ctx) => ProductHomepage(),
            ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
            CartPage.routeName: (ctx) => CartPage(),
            OrderPage.routeName: (ctx) => OrderPage(),
          }),
    );
  }
}
