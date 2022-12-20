import 'package:bbqnation_clone/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:bbqnation_clone/common_widget.dart';
import '../../constants.dart';
import 'list_items.dart';

class GridWithTitle extends StatelessWidget {
  const GridWithTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
          child: Text("Barbeque in a Box", style: titleText2),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 8 / 11, crossAxisCount: 2, mainAxisSpacing: 10),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return GridItemBottomSheet();
                  },
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 16 / 8.5,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://s3-ap-southeast-1.amazonaws.com/asia.urbanpiper.com/media/bizmedia/l/2021/07/20/2._BIB-_overload_COMPRESSED.jpg",
                        ),
                      ),
                    ),
                    const LeaveSpaceWidget(4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          CupertinoIcons.arrowtriangle_up_square,
                          color: Color(0xff800000),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: w / 2 - 64,
                          child: Text("Barbeque in a Box(Non Veg Overload)",
                              style: bodyText3),
                        ),
                      ],
                    ),
                    const LeaveSpaceWidget(4),
                    SizedBox(
                      width: w / 2 - 35,
                      child: Text(
                        "[Five Starters] [Three Curries] [Biriyani] [Three Desserts][Accompanied with Salan, dips & Salad]",
                        style: captionText1,
                        maxLines: 4,
                      ),
                    ),
                    //LeaveSpaceWidget(4),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("559", style: TextStyle(fontSize: 12)),
                          MyCustomButton(),
                        ],
                      ),
                    ),
                    const LeaveSpaceWidget(4),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class GridItemBottomSheet extends StatelessWidget {
  GridItemBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 4 / 3.5,
                  child: Image.network(
                    "https://s3-ap-southeast-1.amazonaws.com/asia.urbanpiper.com/media/bizmedia/l/2021/07/20/2._BIB-_overload_COMPRESSED.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const LeaveSpaceWidget(16),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.arrowtriangle_up_square,
                    color: Color(0xff800000),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text("Barbeque in a Box(Non Veg Overload)", style: bodyText1),
                ],
              ),
              const LeaveSpaceWidget(4),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 16),
                child: Text(
                  "Barbeque Nation Buffet served at Home :[Five Starters] [Three Curries] [Biriyani] [Three Desserts][Accompanied with Salan, dips & Salad ]",
                  style: captionText2,
                  maxLines: 4,
                ),
              ),
              const LeaveSpaceWidget(8),
              ContentsTitleAndContents(
                title: "Grills & Kebabs",
                contents: [
                  ItemContents(dish: "Chicken Tikka", isVeg: false),
                  ItemContents(dish: "Tandoori Tangdi", isVeg: false),
                  ItemContents(dish: "Kalmi Fish Tikka", isVeg: false),
                  ItemContents(dish: "Chilli Garlic Prawns", isVeg: false),
                  ItemContents(dish: "Reshmi Chicken Wings", isVeg: false),
                ],
              ),
              ContentsTitleAndContents(
                title: "Curries & Biryani",
                contents: [
                  ItemContents(dish: "Egg Curry", isVeg: false),
                  ItemContents(dish: "Dum Ka Murgh", isVeg: false),
                  ItemContents(dish: "Laal Mass", isVeg: false),
                  ItemContents(dish: "Chicken Dum Biryani", isVeg: false),
                ],
              ),
              ContentsTitleAndContents(
                title: "Breads",
                contents: [
                  ItemContents(dish: "Paratha (4 Nos)", isVeg: true),
                ],
              ),
              ContentsTitleAndContents(
                title: "Deserts",
                contents: [
                  ItemContents(dish: "Brownie", isVeg: true),
                  ItemContents(dish: "Moong Dal Halwa", isVeg: true),
                  ItemContents(dish: "Gulab Jamun", isVeg: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentsTitleAndContents extends StatelessWidget {
  final String title;

  final List contents;

  ContentsTitleAndContents({
    Key? key,
    required this.title,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title, style: greyText2),
            const SizedBox(
              width: 8,
            ),
            Text(
              ("(${NumberToWord().convert("en-in", contents.length).toString()})"),
              style: captionText2,
            ),
          ],
        ),
        const LeaveSpaceWidget(10),
        ListView.separated(
          shrinkWrap: true,
          itemCount: contents.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return const LeaveSpaceWidget(4);
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  vegOrNonVeg(contents[index].isVeg),
                  const SizedBox(width: 4),
                  Text(
                    contents[index].dish,
                    style: greyText1,
                  )
                ],
              ),
            );
          },
        ),
        const LeaveSpaceWidget(8),
      ],
    );
  }
}

class ItemContents {
  final String dish;
  final bool isVeg;
  ItemContents({required this.dish, required this.isVeg});
}
