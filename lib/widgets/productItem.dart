import 'package:flutter/material.dart';
import 'package:noob_shop/models/product.dart';
import 'package:noob_shop/providers/products.dart';
import 'package:noob_shop/screens/productDetailPage.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
  final String prodId;
  ProductItem({this.prodId});
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    /// listen : false means build() would not run if there is any change in Products
    final Product prodItem = Provider.of<Products>(context, listen: false)
        .findItemById(widget.prodId);
    return Card(
      color: Colors.red,
      elevation: 50,
      child: GridTile(
        child: Hero(
          tag: prodItem.id,
          child: GestureDetector(
            onTap: goToProductDetailPage,
            child: Image.network(
              prodItem.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// Using GridTileBar for more features
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            prodItem.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          leading: Icon(Icons.add_shopping_cart),
          trailing: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: flipFavorite,
          ),
        ),
      ),
    );
  }

  goToProductDetailPage() {
    Navigator.pushNamed(context, ProductDetailPage.routeName,
        arguments: widget.prodId);
  }

  void flipFavorite() {
    setState(() {
      isFavorite = !isFavorite;

      /// TODO: Modify _items of Products Provider
//      product.isFavorite = isFavorite;
    });
  }
}
