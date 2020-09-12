import 'package:flutter/material.dart';
import 'package:noob_shop/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
  final String imageUrl;
  final String id;
  final double price;
  int quantity;
  final String title;
  CartItem({
    @required this.title,
    @required this.id,
    @required this.quantity,
    @required this.price,
    @required this.imageUrl,
  });
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    /// Swipe from Right to Left to delete
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direc) {
        print(widget.id);
        return cart.removeEntireItem(widget.id);
      },
      confirmDismiss: (_) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you sure ?"),
                  content:
                      Text("Do you want to remove this item from the cart ? "),
                  actions: <Widget>[
                    FlatButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        }),
                    FlatButton(
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        })
                  ],
                ));
      },
      key: ValueKey(widget.id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
      ),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(child: Image.network(widget.imageUrl)),
          subtitle: Text(
              "Total Rs. ${(widget.price * widget.quantity).toStringAsFixed(2)}"),
          title: Text(widget.title),
          trailing: Container(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    height: 35,
                    child: FittedBox(
                        child: FloatingActionButton(
                      heroTag: widget.id + "2",
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: CircleBorder(),
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () => cart.incQuant(widget.id),
                    ))),
                Text("   ${widget.quantity}x   "),
                Container(
                  height: 35,
                  child: FittedBox(
                    child: FloatingActionButton(
                        heroTag: widget.id + "1",
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: CircleBorder(),
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: () => widget.quantity > 1
                            ? {cart.decQuant(widget.id)}
                            : null),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
