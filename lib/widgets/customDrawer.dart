import 'package:flutter/material.dart';
import 'package:noob_shop/screens/orderPage.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                "Noob Shop",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop", style: TextStyle(fontSize: 18)),
            onTap: goToProductHomePage,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders", style: TextStyle(fontSize: 18)),
            onTap: goToOrderPage,
          ),
          Divider(),
        ],
      ),
    );
  }

  void goToOrderPage() {
    Navigator.pushReplacementNamed(context, OrderPage.routeName);
  }

  void goToProductHomePage() {
    Navigator.pushReplacementNamed(context, '/');
  }
}
