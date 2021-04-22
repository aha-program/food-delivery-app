import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/const.dart';
import 'package:food_delivery/food_info_page/food_info_page.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.image,
    required this.foodName,
    required this.price,
    required this.tag,
  }) : super(key: key);
  final String image;
  final String foodName;
  final String price;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodInfoPage(
                image: image,
                name: foodName,
                tag: tag,
                price: price,
              ),
            ));
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.70,
            width: MediaQuery.of(context).size.width / 2.00,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.25,
                    width: MediaQuery.of(context).size.width / 2.00,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 60,
                            offset: Offset(0, 30),
                            color: Colors.black.withOpacity(0.01),
                            //Color(0xFF393939).withOpacity(0.1),
                          )
                        ]),
                  ),
                ),
                Positioned(
                  // top: -10,
                  left: 10,
                  right: 10,
                  child: Hero(
                    tag: tag,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      // width: MediaQuery.of(context).size.height / 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(image),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            spreadRadius: 7,
                            color: Colors.black12,
                            offset: Offset(0, 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 55,
                  left: 10,
                  right: 10,
                  child: AutoSizeText(
                    foodName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kRedColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
