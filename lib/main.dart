import "package:flutter/material.dart";
import './screens/productDetailPage.dart';
import 'package:noob_shop/screens/productHomePage.dart';

void main() => runApp(MyShop());

class MyShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ProductHomepage(),
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.purple),
        routes: {
          ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
        });
  }
}
