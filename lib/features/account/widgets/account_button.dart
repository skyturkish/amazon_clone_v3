import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AccountButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: PaddingVariables.horizontalMedium,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 0.0,
          ), // 0.0 yapıyoruz güzel bir görüntü sağlıyor böyle yapınca, küçük trick
          borderRadius: BorderRadius.circular(
            // outlinebutton ile kullanılınca ortaya çıkıyor bu trick
            50,
          ),
          color: Colors.white,
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black12.withOpacity(0.03), // you can use if you can more darker inside button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class PaddingVariables {
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(horizontal: 10);
}
