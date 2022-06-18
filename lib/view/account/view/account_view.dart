import 'package:amazon_clone_v3/core/constants/color/color_constants.dart';
import 'package:amazon_clone_v3/core/init/translations/locale_keys.g.dart';
import 'package:amazon_clone_v3/product/widget/button/top_buttons.dart';
import 'package:amazon_clone_v3/providers/user_providers.dart';
import 'package:amazon_clone_v3/view/account/view/single_product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final List<String> list = [
    "https://images.unsplash.com/photo-1655527251255-bf7b8bba5b76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1655527251255-bf7b8bba5b76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1655527251255-bf7b8bba5b76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
          Container(
            decoration: const BoxDecoration(
              gradient: ColorVariables.appBarGradient,
            ),
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                RichText(
                  // Bak burada Richtext sadece yazı kadar yer kaplıyordu, row yapınca parent'ı komple tüm satır oldu ve hata giderildi
                  text: TextSpan(
                    text: LocaleKeys.hello.tr(),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: user.name,
                        style: const TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: TopButtons(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  LocaleKeys.yourOrders.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  LocaleKeys.seeAll.tr(),
                  style: TextStyle(
                    color: ColorVariables.selectedNavBarColor,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 170,
            padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  image: list[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
