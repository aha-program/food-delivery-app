import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/const.dart';
import 'package:food_delivery/home_page/widgets/category_title.dart';
import 'package:food_delivery/home_page/widgets/fake_data.dart';
import 'package:food_delivery/home_page/widgets/food_card.dart';
import 'package:food_delivery/search_page/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: BottomNavyBar(
      //   selectedIndex: 0,
      //   backgroundColor: kBackgroundColor,
      //   showElevation: false,
      //   itemCornerRadius: 24,
      //   curve: Curves.easeIn,
      //   onItemSelected: (a) {},
      //   items: <BottomNavyBarItem>[
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.apps),
      //       title: Text(''),
      //       activeColor: Colors.red,
      //     ),
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.people),
      //       title: Text('Users'),
      //       activeColor: Colors.purpleAccent,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.message),
      //       title: Text(
      //         'Messages test for mes teset test test ',
      //       ),
      //       activeColor: Colors.pink,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.settings),
      //       title: Text('Settings'),
      //       activeColor: Colors.blue,
      //       textAlign: TextAlign.center,
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/menu_icon.svg',
                    color: Colors.black,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/icons/shopping_cart_icon.svg',
                    color: Colors.grey[900],
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Delicious \nfood for you",
                    style:
                        TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryTitle(title: "Food", isActive: true),
                      CategoryTitle(title: "Drinks", isActive: false),
                      CategoryTitle(title: "Snacks", isActive: false),
                      CategoryTitle(title: "Sauce", isActive: false),
                    ],
                  ),
                ),
                Container(
                  height: size.height / 2.2,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      return FoodCard(
                        image: foodList[index].image,
                        foodName: foodList[index].foodName,
                        price: foodList[index].price,
                        tag: foodList[index].tag,
                      );
                    },
                  ),
                ),
              ],
            )),
            Container(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color:
                          currentIndex == 0 ? kRedColor : Colors.grey.shade400,
                      size: 30,
                    ),
                    onPressed: () {
                      setBottomBarIndex(0);
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: currentIndex == 1
                            ? kRedColor
                            : Colors.grey.shade400,
                        size: 30,
                      ),
                      onPressed: () {
                        setBottomBarIndex(1);
                      }),
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.person,
                        color: currentIndex == 2
                            ? kRedColor
                            : Colors.grey.shade400,
                        size: 30,
                      ),
                      onPressed: () {
                        setBottomBarIndex(2);
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.restore_outlined,
                        color: currentIndex == 3
                            ? kRedColor
                            : Colors.grey.shade400,
                        size: 30,
                      ),
                      onPressed: () {
                        setBottomBarIndex(3);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
