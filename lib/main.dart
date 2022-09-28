import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import 'providers/auth.dart';
import 'providers/cartitem.dart';
import 'providers/category.dart';
import 'providers/orders.dart';
import 'providers/reviews.dart';
import 'providers/themes.dart';
import 'screens/Electronics_category_screens/electronics_category._screen.dart';
import 'screens/Electronics_category_screens/electronics_subcategory_screen.dart';
import 'screens/auth_screen/auth_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/core/widgets/bottom_navigation_bar_screen.dart';
import 'screens/core/widgets/sub_sub_category_screen.dart';
import 'screens/flash_sales/flash_sales.dart';
import 'screens/single_product_overview/product_overview.dart';
import 'screens/single_product_overview/widgets/product_specifications.dart';
import 'screens/wishlist/wishlist_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (context, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.PRODUCTS,
          ),
          create: (context) => Products(
            null.toString(),
            null.toString(),
            [],
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Order>(
          update: (context, auth, previousOrders) => Order(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
          create: (context) => Order(
            null.toString(),
            null.toString(),
            [],
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Category(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Review(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final _themeProvider = Provider.of<ThemeProvider>(context).themeMode;
          // Provider.of<Auth>(context).tryAutoLogin().then((value) {
          //   if (value) {
          //   }
          // });
          return Consumer<Auth>(
            builder: (context, value, child) => MaterialApp(
              themeMode: _themeProvider,
              darkTheme: Mythemes.darkTheme,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: Mythemes.lightTheme,
              home: const BottomNav(),
              routes: {
                ProductOverview.routeName: (ctx) => const ProductOverview(),
                CartScreen.routeName: (ctx) => const CartScreen(),
                ElectronicsScreen.routeName: (ctx) => const ElectronicsScreen(),
                ElectronicsProductScreen.routeName: (ctx) =>
                    const ElectronicsProductScreen(),
                SubSubCategoryScreen.routeName: (ctx) =>
                    const SubSubCategoryScreen(),
                Wishlist.routeName: (ctx) => const Wishlist(),
                FlashSales.routeName: (ctx) => const FlashSales(),
                Specifications.routeName: (context) => const Specifications(),
                AuthScreen.routeName: (context) => AuthScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}
