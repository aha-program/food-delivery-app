import 'package:flutter/material.dart';

import 'package:food_delivery/const.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? kRedColor : Colors.grey[500],
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 3,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: isActive ? kRedColor : null,
            ),
          )
        ],
      ),
    );
  }
}
