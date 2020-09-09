import 'package:flutter/material.dart';
import 'package:noob_shop/data/dumProductsData.dart';
import 'package:noob_shop/widgets/productItem.dart';

class ProductHomepage extends StatefulWidget {
  @override
  _ProductHomepageState createState() => _ProductHomepageState();
}

class _ProductHomepageState extends State<ProductHomepage> {
  final prodData = dummyProductData;

  @override
  Widget build(BuildContext context) {
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
            product: prodData[index],
          ),
          itemCount: prodData.length,
        ));
  }
}
