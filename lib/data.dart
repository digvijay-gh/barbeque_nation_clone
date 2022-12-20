class ListCategory {
  String title;
  List itemList;
  ListCategory({
    required this.title,
    required this.itemList,
  });
}

ListCategory kebabAndTikka =
    ListCategory(title: "Kebab & Tikkas", itemList: kebabAndTikkaItemList);

class ListItem {
  String name;
  String description;
  String price;
  String imageUrl;
  bool isVeg;
  ListItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isVeg,
  });
}

List<ListItem> kebabAndTikkaItemList = [
  ListItem(
    name: "Chicken Seekh Kebab",
    description:
        "Succulent kebabs (6Nos) made from tender meat, masalas and seasoning,grilled on skewers till perfection. Served with Mint Chutney &Lacha Onions",
    price: "₹209",
    imageUrl:
        "https://s3-ap-southeast-1.amazonaws.com/asia.urbanpiper.com/media/bizmedia/2021/10/28/Starters__Seekh_Kebab.jpg",
    isVeg: false,
  ),
  ListItem(
    name: "Mutton Seekh Kebab",
    description:
        "Scrumptious, full of juices & flavors- These mutton mince kebabs (6Nos) cooked with Indian aromatic spices are perfect as a starter.",
    price: "₹299",
    imageUrl:
        "https://s3-ap-southeast-1.amazonaws.com/asia.urbanpiper.com/media/bizmedia/2021/12/22/Mutton_Sheek_Kebab.png",
    isVeg: false,
  ),
  ListItem(
    name: "U & BBQ Buddy Platter (Non Veg)",
    description:
        "A mighty Non -Veg platter:--Hot Chilly Garlic Prawns (6Pcs)-Tandoori Tangdi (2Pcs)-Cheesy Triangle (2pcs)-Tandoori Fish (6 Pcs)-Chicken Wings (2 Pcs)[Angoori Gulab Jamun- 4pcs].",
    price: "₹609",
    imageUrl:
        "https://s3-ap-southeast-1.amazonaws.com/asia.urbanpiper.com/media/bizmedia/2021/12/15/Non_Veg_Platter-min.png",
    isVeg: false,
  ),
  ListItem(
    name: "Tandoori Paneer Tikka",
    description:
        "Cottage Cheese marinated in Indian spices and hung curd cooked in clay oven -Tandoor and served with Salad mix and Mint Chutney.",
    price: "₹309",
    imageUrl:
        "https://s3-ap-southeast-1.amazonaws.com/asia.urbanpiper.com/media/bizmedia/l/2021/07/08/5X4A8891-min-min_COMPRESSED.jpg",
    isVeg: true,
  ),
];
