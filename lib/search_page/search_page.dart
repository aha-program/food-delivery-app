import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/const.dart';
import 'package:food_delivery/home_page/widgets/fake_data.dart';
import 'package:food_delivery/home_page/widgets/food_card.dart';
import 'package:food_delivery/search_page/small_food_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.back),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          // enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                child: StaggeredGridView.countBuilder(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    return SmallFoodCard(
                      image: foodList[index].image,
                      foodName: foodList[index].foodName,
                      price: foodList[index].price,
                      tag: foodList[index].tag,
                      index: index,
                    );
                  },
                  addRepaintBoundaries: true,
                  shrinkWrap: true,
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, 1.8);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
