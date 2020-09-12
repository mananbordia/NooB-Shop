import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noob_shop/providers/orders.dart';

// ignore: must_be_immutable
class OrderItem extends StatefulWidget {
  SingleOrder singleOrder;
  OrderItem({
    @required this.singleOrder,
  });

  @override
  _OrderItemState createState() => _OrderItemState();
}

bool _isExpanded = true;

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(DateFormat.yMMMEd().format(widget.singleOrder.date)),
            subtitle: Text(DateFormat.Hm().format(widget.singleOrder.date)),
            trailing: Container(
              // Todo : Width should be dynamic
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("   ${widget.singleOrder.total}   "),
                  IconButton(
                    icon: Icon(
                        (_isExpanded) ? Icons.expand_less : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Container(
                height: 100,
                child: ListView.builder(
                    itemCount: widget.singleOrder.items.length,
                    itemBuilder: (_, index) => ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                                widget.singleOrder.items[index].imageUrl),
                          ),
                          title:
                              Text("${widget.singleOrder.items[index].title}"),
                          trailing: Text(
                              "${widget.singleOrder.items[index].quantity}x"),
                          subtitle: Text(
                              "${widget.singleOrder.items[index].price * widget.singleOrder.items[index].quantity}"),
                        )))
        ],
      ),
    );
  }
}
