import 'package:amazon_clone_v3/constants/color/color_constants.dart';
import 'package:amazon_clone_v3/constants/init/locale_keys.g.dart';
import 'package:amazon_clone_v3/features/account/widgets/single_product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  final List<String> list = [
    "https://images.unsplash.com/photo-1655527251255-bf7b8bba5b76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1655527251255-bf7b8bba5b76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1655527251255-bf7b8bba5b76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
  ];
  Orders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
