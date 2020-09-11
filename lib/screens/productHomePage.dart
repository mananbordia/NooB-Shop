import 'package:flutter/material.dart';
import 'package:noob_shop/providers/cart.dart';
import 'package:noob_shop/providers/products.dart';
import 'package:noob_shop/screens/cartPage.dart';
import 'package:noob_shop/widgets/badge.dart';
import 'package:noob_shop/widgets/productItem.dart';
import 'package:provider/provider.dart';

class ProductHomepage extends StatefulWidget {
  @override
  _ProductHomepageState createState() => _ProductHomepageState();
}

enum FilterOptions {
  all,
  favorites,
}
bool showFavorite = false;

class _ProductHomepageState extends State<ProductHomepage> {
  @override
  Widget build(BuildContext context) {
    /// Gives List of All Product Items or Favorite Items
    final productsItems = showFavorite
        ? Provider.of<Products>(context).favoriteItems
        : Provider.of<Products>(context).items;

    return Scaffold(
        appBar: AppBar(title: Text("Noob Shop"), actions: <Widget>[
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: goToCartPage,
            ),
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemsCount.toString(),
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selected) {
              setState(() {
                showFavorite = (selected == FilterOptions.favorites);
              });
              print(showFavorite);
            },
            itemBuilder: (_) => [
              PopupMenuItem(child: Text("All"), value: FilterOptions.all),
              PopupMenuItem(
                  child: Text("Favorites"), value: FilterOptions.favorites),
            ],
            elevation: 10,
          )
        ]),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: productsItems[index], child: ProductItem()),
          itemCount: productsItems.length,
        ));
  }

  void goToCartPage() {
    Navigator.of(context).pushNamed(CartPage.routeName);
  }
}
