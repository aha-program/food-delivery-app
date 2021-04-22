import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
            icon: Icon(CupertinoIcons.heart),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
