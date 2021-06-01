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
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products('', '', []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders('', '', []),
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
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
