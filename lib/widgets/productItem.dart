import 'package:flutter/material.dart';
import 'package:noob_shop/providers/cart.dart';
import 'package:noob_shop/providers/product.dart';
import 'package:noob_shop/screens/productDetailPage.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    /// listen : false means build() would not run if there is any change in Products
    final Product prodItem = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);
    return Card(
      color: Colors.red,
      elevation: 50,
      child: GridTile(
        child: Hero(
          tag: prodItem.id,
          child: GestureDetector(
            onTap: () => goToProductDetailPage(prodItem.id),
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
          leading: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () => cart.addItem(
                prodItem.id, prodItem.title, prodItem.price, prodItem.imageUrl),
          ),
          trailing: Consumer<Product>(
            builder: (_, prodItem, __) => IconButton(
              icon: Icon(
                prodItem.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: prodItem.flipFavorite,
            ),
          ),
        ),
      ),
    );
  }

  goToProductDetailPage(String prodId) {
    Navigator.pushNamed(context, ProductDetailPage.routeName,
        arguments: prodId);
  }
}
