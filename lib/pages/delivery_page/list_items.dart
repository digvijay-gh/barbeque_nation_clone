import 'package:bbqnation_clone/data.dart';
import 'package:bbqnation_clone/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common_widget.dart';
import '../../constants.dart';

class ListWithTitle extends StatelessWidget {
  const ListWithTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Text("Kebab & Tikkas", style: titleText2),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: kebabAndTikka.itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet<dynamic>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    var kItem = kebabAndTikkaItemList[index];
                    return ItemDetailsPopUp(kItem: kItem);
                  },
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.175,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 16, 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                vegOrNonVeg(kebabAndTikkaItemList[index].isVeg),
                                const SizedBox(width: 4),
                                Text(
                                  kebabAndTikkaItemList[index].name,
                                  maxLines: 1,
                                  style: bodyText2,
                                )
                              ],
                            ),
                            const LeaveSpaceWidget(8),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 4),
                              child: Text(
                                kebabAndTikkaItemList[index].description,
                                maxLines: 3,
                                style: captionText1,
                              ),
                            ),
                            const LeaveSpaceWidget(8),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                kebabAndTikkaItemList[index].price,
                                style: const TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: kebabAndTikkaItemList[index].imageUrl,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      color: myOrange,
                                      value: downloadProgress.progress),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          child: MyCustomButton(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const LeaveSpaceWidget(8);
          },
        ),
      ],
    );
  }
}

class ItemDetailsPopUp extends StatelessWidget {
  const ItemDetailsPopUp({
    Key? key,
    required this.kItem,
  }) : super(key: key);

  final ListItem kItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: kItem.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const LeaveSpaceWidget(16),
              Row(
                children: [
                  vegOrNonVeg(kItem.isVeg),
                  const SizedBox(width: 4),
                  Text(kItem.name, maxLines: 1, style: bodyText1)
                ],
              ),
              const LeaveSpaceWidget(4),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(kItem.description, style: captionText2),
              ),
              const LeaveSpaceWidget(12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: myOrange,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "ADD TO CART",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
