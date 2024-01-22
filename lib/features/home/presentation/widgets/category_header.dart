import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {

  const CategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Categories"),
            Text("See All",style: TextStyle(color: Color(0xff3669C9)),),
          ],
        ),
      ],
    );
  }
}