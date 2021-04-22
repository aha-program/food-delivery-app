class Food {
  final String image;
  final String foodName;
  final String price;
  final String tag;

  Food({
    required this.tag,
    required this.image,
    required this.foodName,
    required this.price,
  });
}

List<Food> foodList = [
  Food(
    tag: '1',
    foodName: "Veggie tomato mix",
    price: "N1,900",
    image: "assets/food1.png",
  ),
  Food(
    tag: '2',
    foodName: "Spicy fish sauce",
    price: "N2,300",
    image: "assets/food2.png",
  ),
  Food(
    tag: '3',
    foodName: "Egg and cucmber...",
    price: "N1,900",
    image: "assets/food3.png",
  ),
  Food(
    tag: '4',
    foodName: "Veggie tomato mix",
    price: "N1,900",
    image: "assets/food1.png",
  ),
  Food(
    tag: '5',
    foodName: "Veggie tomato mix",
    price: "N1,900",
    image: "assets/food1.png",
  ),
  Food(
    tag: '6',
    foodName: "Veggie tomato mix",
    price: "N1,900",
    image: "assets/food1.png",
  ),
];
