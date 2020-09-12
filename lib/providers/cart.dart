import 'dart:math';

import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Map<String, CartProduct> _items = {};

  /// Returns Map of Cart Items
  Map<String, CartProduct> get items {
    return {..._items};
  }

  /// Returns List of Cart Items
  List<CartProduct> get itemsAsList {
    return [..._items.values.toList()];
  }

  /// Removes the CartItem
  void removeEntireItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  /// Total items in our Cart
  int get itemsCount {
    int iCount = 0;
    _items.forEach((k, cItem) {
      iCount += cItem.quantity;
    });
    return iCount;
  }

  /// Net Cart Total Amount
  double get totalAmount {
    double tAmount = 0;
    _items.forEach((k, cItem) {
      tAmount += cItem.quantity * cItem.price;
    });
    return tAmount;
  }

  /// Adding Items to Cart
  void addItem(String id, String title, double price, String imageUrl) {
    if (_items.containsKey(id)) {
      incQuant(id);
    } else {
      _items.putIfAbsent(
          id,
          () => CartProduct(
                title: title,
                quantity: 1,
                price: price,
                id: id,
                imageUrl: imageUrl,
              ));
      notifyListeners();
    }
  }

  /// Remove Items to Cart
  void removeItem(String id) {
    if (!_items.containsKey(id)) {
      print("Your System has error : Check removeItem function in Cart.dart");
      return;
    } else {
      if (_items[id].quantity == 1) {
        removeEntireItem(id);
      } else {
        decQuant(id);
      }
      notifyListeners();
    }
  }

  /// Just Increase Quantity of an item
  void incQuant(String id) {
    _items.update(id, (xItem) {
      return CartProduct(
        price: xItem.price,
        quantity: xItem.quantity + 1,
        title: xItem.title,
        id: xItem.id,
        imageUrl: xItem.imageUrl,
      );
    });
    notifyListeners();
  }

  /// Just Decrease Quantity of an item
  void decQuant(String id) {
    _items.update(id, (xItem) {
      return CartProduct(
        price: xItem.price,
        quantity: max(xItem.quantity - 1, 1),
        title: xItem.title,
        id: xItem.id,
        imageUrl: xItem.imageUrl,
      );
    });
    notifyListeners();
  }

  void removeAll() {
    _items = {};
    notifyListeners();
  }
}

class CartProduct {
  String id;
  String title;
  int quantity;
  double price;
  String imageUrl;
  CartProduct({this.id, this.title, this.quantity, this.price, this.imageUrl});
}
