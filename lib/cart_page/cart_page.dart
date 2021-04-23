import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery/const.dart';
import 'package:food_delivery/home_page/widgets/fake_data.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text(
      //     "Cart",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   iconTheme: IconThemeData(color: Colors.black),
      //   centerTitle: true,
      // ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.back),
                  onPressed: () {},
                ),
                Expanded(
                  child: Text(
                    "Cart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.all(5),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return CartTile(
                  foodName: foodList[index].foodName,
                  image: foodList[index].image,
                  tag: foodList[index].tag,
                  price: foodList[index].price,
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.image,
    required this.tag,
    required this.foodName,
    required this.price,
  }) : super(key: key);
  final String image;
  final String tag;
  final String foodName;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.20,
      closeOnScroll: true,
      child: Container(
        height: 120,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 3,
              color: Colors.black12.withOpacity(0.01),
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              children: [
                Hero(
                  tag: tag,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(image),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 1,
                          color: Colors.black12,
                          offset: Offset(0, 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        color: kRedColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              right: 10,
              bottom: 5,
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kRedColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      secondaryActions: <Widget>[
        MaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          color: kDarkRed,
          height: 55,
          elevation: 0,
          child: Icon(
            CupertinoIcons.heart,
            color: Colors.white,
          ),
        ),
        MaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          color: kDarkRed,
          height: 55,
          elevation: 0,
          child: Icon(
            CupertinoIcons.delete,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// ListView(
//           padding: const EdgeInsets.all(20),
//           children: [
//             Slidable(
//               actionPane: SlidableDrawerActionPane(),
//               actionExtentRatio: 0.25,
//               child: Container(
//                 color: Colors.white,
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.indigoAccent,
//                     child: Text('Azizbek'),
//                     foregroundColor: Colors.white,
//                   ),
//                   title: Text('Tile n°'),
//                   subtitle: Text('SlidableDrawerDelegate'),
//                 ),
//               ),
//               secondaryActions: <Widget>[
//                 MaterialButton(
//                   onPressed: () {},
//                   shape: CircleBorder(),
//                   color: Colors.red,
//                   height: 55,
//                   child: Icon(
//                     CupertinoIcons.heart,
//                     color: Colors.white,
//                   ),
//                 ),
//                 MaterialButton(
//                   onPressed: () {},
//                   shape: CircleBorder(),
//                   color: Colors.red,
//                   height: 55,
//                   child: Icon(
//                     CupertinoIcons.delete,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
