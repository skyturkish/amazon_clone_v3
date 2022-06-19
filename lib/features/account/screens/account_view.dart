import 'package:amazon_clone_v3/constants/color/color_constants.dart';
import 'package:amazon_clone_v3/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone_v3/features/account/widgets/orders.dart';
import 'package:amazon_clone_v3/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Gather all consts variables
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: ColorVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: 120,
                height: 45, // you can use transparent images like that
                color: Colors.transparent,
                child: Image.asset('assets/images/amazon_in.png'), // You can İmagesManager like LocalizationManager
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const BelowAppBar(),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: TopButtons(),
          ),
          Orders(),
        ],
      ),
    );
  }
}
