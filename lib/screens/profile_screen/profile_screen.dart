import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';
import '../auth_screen/auth_screen.dart';
import 'widgets/account_preview.dart';
import 'widgets/app_products.dart';
import 'widgets/form.dart';
import 'widgets/orders.dart';
import 'widgets/services.dart';
import 'widgets/settings.dart';
import 'widgets/theme.dart';
import 'widgets/top_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          Consumer<Auth>(
            builder: (context, value, _) => TextButton.icon(
              label: value.isAuth
                  ? const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: () {
                value.isAuth
                    ? value.logout()
                    : pushNewScreen(
                        context,
                        screen: AuthScreen(),
                      );
              },
              icon: Icon(
                value.isAuth ? Icons.logout : Icons.login,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              // AccountPreview(),
              // IconRow(),
              Orders(),
              Services(),
              Theming(),
              Settings(),
              AllProducts(),
              FormWidget(),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
