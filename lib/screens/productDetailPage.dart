import 'package:flutter/material.dart';
import 'package:noob_shop/providers/product.dart';
import 'package:noob_shop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context).settings.arguments;

    /// listen : false means build() would not run if there is any change in Products
    final Product prodItem =
        Provider.of<Products>(context, listen: false).findItemById(prodId);
    return Scaffold(
      /// Way to get product metadata is very badly implemented
      /// Try extracting data from id
      appBar: AppBar(title: Text(prodItem.title)),

      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Hero(
              tag: prodItem.id,
              child: Image.network(
                prodItem.imageUrl,
                fit: BoxFit.cover,
              )),
          Text(prodItem.description),
        ]),
      ),
    );
  }
}
