import 'package:flutter/material.dart';
import 'package:noob_shop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    /// Currently it gives Product -> Change it to id
    final Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      /// Way to get product metadata is very badly implemented
      /// Try extracting data from id
      appBar: AppBar(title: Text(product.title)),
    );
  }
}
