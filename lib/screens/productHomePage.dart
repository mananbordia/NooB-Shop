import 'package:flutter/material.dart';
import 'package:noob_shop/providers/products.dart';
import 'package:noob_shop/widgets/productItem.dart';
import 'package:provider/provider.dart';

class ProductHomepage extends StatefulWidget {
  @override
  _ProductHomepageState createState() => _ProductHomepageState();
}

class _ProductHomepageState extends State<ProductHomepage> {
  @override
  Widget build(BuildContext context) {
    /// Gives and object of Products class
    final products = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Noob Shop")),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) => ProductItem(
            product: products.items[index],
          ),
          itemCount: products.items.length,
        ));
  }
}
