import 'package:amazon_clone_v3/constants/color/color_constants.dart';
import 'package:amazon_clone_v3/constants/init/locale_keys.g.dart';
import 'package:amazon_clone_v3/providers/user_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
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
    );
  }
}
