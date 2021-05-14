class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    this.id = "",
    this.name = "",
    this.desc = "",
    this.price = 0.0,
    this.color = "",
    this.image = "",
  });
}

final products = [
  Item(
    id: "Codepur",
    name: "iPhone 12 Pro",
    desc: "Apple iPhone 12 generation",
    price: 999,
    color: "#33505a",
    image: "",
  ),
];
