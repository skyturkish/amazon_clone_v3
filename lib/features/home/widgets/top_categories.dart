import 'package:amazon_clone_v3/constants/images/image_constant.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 75, // --->
        itemCount: ImageVariables.categoryImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    ImageVariables.categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  // they must be dynmaic
                  ImageVariables.categoryImages[index]['title']!,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
