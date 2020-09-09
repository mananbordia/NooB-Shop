import "package:flutter/material.dart";
import 'package:noob_shop/providers/products.dart';
import 'package:provider/provider.dart';
import './screens/productDetailPage.dart';
import 'package:noob_shop/screens/productHomePage.dart';

void main() => runApp(MyShop());

class MyShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Wrapping the highest widget in tree that wants Products provider
    return ChangeNotifierProvider(
      builder: (ctx) => Products(),
      child: MaterialApp(
          initialRoute: '/',
          theme: ThemeData(
              primarySwatch: Colors.indigo, accentColor: Colors.purple),
          routes: {
            '/': (ctx) => ProductHomepage(),
            ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
          }),
    );
  }
}
