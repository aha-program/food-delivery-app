import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/cart_page/cart_page.dart';
import 'package:food_delivery/const.dart';
import 'package:food_delivery/utils/custom_material_button.dart';

import 'custom_app_bar.dart';

class FoodInfoPage extends StatelessWidget {
  const FoodInfoPage(
      {Key? key,
      required this.image,
      required this.name,
      required this.tag,
      required this.price})
      : super(key: key);
  final String image;
  final String name;
  final String price;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: tag,
                      child: Container(
                        height:
                            220, //MediaQuery.of(context).size.height * 0.25,
                        // width: 220,
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
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        color: kRedColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery info",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Return policy",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomMaterialButton(
                title: "Add to Cart",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
