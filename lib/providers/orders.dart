import 'package:flutter/material.dart';
import 'package:noob_shop/providers/cart.dart';

class SingleOrder {
  List<CartProduct> items;
  String id;
  DateTime date;
  double total;
  SingleOrder({this.id, this.items, this.date, this.total});
}

class Order with ChangeNotifier {
  List<SingleOrder> _orderList = [];
  void addOrder(SingleOrder sOrder) {
    _orderList.add(sOrder);
    print(_orderList.length);
    notifyListeners();
  }

  /// Return List in reverse order
  List<SingleOrder> get orderList {
    return [..._orderList.reversed];
  }

  int get orderCount {
    return _orderList.length;
  }
}
