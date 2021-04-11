
/*
Link in description
 */

class Categories {
  String nameCategory;
  String imgCategory;
  List<Content> content;
  Categories({this.nameCategory, this.imgCategory, this.content});
}

List<Categories> categories = [
  Categories(nameCategory: "Fruits", content: fruits, imgCategory: "assets/fruits.png"),
  Categories(nameCategory: "Vegetables", content: [], imgCategory: "assets/vegetables.png"),
  Categories(nameCategory: "Drinks", content: [], imgCategory: "assets/drink.png"),
  Categories(nameCategory: "Snack", content: snacks, imgCategory: "assets/snack.png"),
  Categories(nameCategory: "Bake", content: [], imgCategory: "assets/bake.png"),
];

class Content {
  String name;
  String imageContent;
  double price;
  bool isFavorite;
  String description;
  Content({this.name, this.imageContent, this.price, this.isFavorite, this.description});
}

List<Content> snacks = [
  Content(
      name: "Poca Wavy",
      imageContent: "assets/snack1.png",
      price: 5.00,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
  Content(
      name: "Poca Party",
      imageContent: "assets/snack2.png",
      price: 5.00,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
  Content(
      name: "Poca Lays",
      imageContent: "assets/snack3.png",
      price: 5.00,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
  Content(
      name: "Poca Tôm Hùm",
      imageContent: "assets/snack4.png",
      price: 5.00,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
];

List<Content> fruits = [
  Content(
      name: "Hass Avocado",
      imageContent: "assets/avocado.png",
      price: 23.65,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
  Content(
      name: "Banana (each)",
      imageContent: "assets/banana.png",
      price: 15.00,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
  Content(
      name: "Peeled Carrots",
      imageContent: "assets/carot.png",
      price: 16.00,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
  Content(
      name: "Orange",
      imageContent: "assets/orange.png",
      price: 18.00,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
  Content(
      name: "Juicy strawberry",
      imageContent: "assets/strawberry.png",
      price: 23.65,
      isFavorite: false,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
];
