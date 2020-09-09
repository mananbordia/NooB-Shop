import 'package:flutter/material.dart';
import 'package:noob_shop/models/product.dart';

class Products with ChangeNotifier {
  /// _items is made private so that it can't be accessed from other pages.
  /// Todo : Get itemsList from server : Current data is a Dummy Data
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Blue Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Purple Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Yellow Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
  ];

  /// Other Pages with permission can access _items by this Getter
  List<Product> get items {
    /// Don't use - > {return _items} as this passes reference to _items which is harmful
    /// Instead Pass a copy of _items
    return [..._items]; // ignore: sdk_version_ui_as_code
  }

  Product findItemById(String id) {
    return _items.firstWhere((xItem) => xItem.id == id);
  }

  void addProduct() {
    /// Still to code
    notifyListeners();
  }

  void removeProduct() {
    /// Still to code
    notifyListeners();
  }

  void modifyProduct() {
    /// Still to code
    notifyListeners();
  }
}
