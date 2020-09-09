import 'package:flutter/material.dart';
import 'package:noob_shop/models/product.dart';
import 'package:noob_shop/screens/productDetailPage.dart';

class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();

  /// Reminder : Using product as final variable can be wrong as isFav is changed
  final Product product;
  ProductItem({this.product});
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.product.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      elevation: 50,
      child: GridTile(
        child: GestureDetector(
          onTap: goToProductDetailPage,
          child: Image.network(
            widget.product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),

        /// Using GridTileBar for more features
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            widget.product.title,
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
        arguments: widget.product);
  }

  void flipFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.product.isFavorite = isFavorite;
    });
  }
}
