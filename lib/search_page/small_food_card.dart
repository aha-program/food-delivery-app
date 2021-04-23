import 'package:flutter/material.dart';

import 'package:food_delivery/const.dart';
import 'package:food_delivery/food_info_page/food_info_page.dart';

class SmallFoodCard extends StatelessWidget {
  const SmallFoodCard({
    Key? key,
    required this.image,
    required this.foodName,
    required this.price,
    required this.tag,
    required this.index,
  }) : super(key: key);
  final String image;
  final String foodName;
  final String price;
  final String tag;
  final int index;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          index.isOdd
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                )
              : Container(),
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            // width: MediaQuery.of(context).size.width * 0.6,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  child: Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width * 0.39,
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
                  left: 25,
                  right: 25,
                  child: Hero(
                    tag: tag,
                    child: Container(
                      height: 150,
                      width: 150,
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
                  top: 160,
                  left: 10,
                  right: 10,
                  child: Text(
                    foodName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Positioned(
                  top: 230,
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
