import 'package:flutter/material.dart';
import 'package:noob_shop/providers/cart.dart';
import 'package:noob_shop/widgets/cartItem.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart-page';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Column(
        children: <Widget>[
          Card(
              elevation: 10,
              margin: EdgeInsets.all(8),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Chip(
                          backgroundColor: Theme.of(context).primaryColor,
                          label: Text(
                            "Rs. ${cart.totalAmount.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        FlatButton(
                          child: Text(
                            "Order Now",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                          onPressed: () => {},
                        )
                      ]))),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => CartItem(
                id: cart.itemsAsList[index].id,
                title: cart.itemsAsList[index].title,
                price: cart.itemsAsList[index].price,
                quantity: cart.itemsAsList[index].quantity,
                imageUrl: cart.itemsAsList[index].imageUrl,
              ),
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
