import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/routes/auth_view.dart';
import 'package:shop_app/routes/cart_view.dart';
import 'package:shop_app/routes/edit_product_view.dart';
import 'package:shop_app/routes/orders_view.dart';
import 'package:shop_app/routes/product_detail_view.dart';
import 'package:shop_app/routes/products_overview_view.dart';
import 'package:shop_app/routes/user_products_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth ? ProductsOverviewView() : AuthView(),
          routes: {
            ProductDetailView.routeName: (ctx) => ProductDetailView(),
            CartView.routeName: (ctx) => CartView(),
            OrdersView.routeName: (ctx) => OrdersView(),
            UserProductsView.routeName: (ctx) => UserProductsView(),
            EditProductView.routeName: (ctx) => EditProductView(),
          },
        ),
      ),
    );
  }
}
