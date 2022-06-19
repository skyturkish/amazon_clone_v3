import 'package:amazon_clone_v3/constants/init/locale_keys.g.dart';
import 'package:amazon_clone_v3/features/account/widgets/account_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    // burayı dinamik yapabilirsin, GridViewBuilder atarsın, bir liste verirsin
    // dinamik olur
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: LocaleKeys.yourOrders.tr(),
              onTap: () {},
            ),
            AccountButton(
              text: LocaleKeys.turnSeller.tr(),
              onTap: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              AccountButton(
                text: LocaleKeys.logOut.tr(),
                onTap: () {},
              ),
              AccountButton(
                text: LocaleKeys.yourWishList.tr(),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
