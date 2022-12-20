import 'package:bbqnation_clone/common_widget.dart';
import 'package:bbqnation_clone/theme.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class HappinesCardWidget extends StatelessWidget {
  const HappinesCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TitleWidget(title: "Happiness card for Digvijay"),
        LeaveSpaceWidget(8),
        HappinessCardItems(),
      ],
    );
  }
}

class HappinessCardItems extends StatelessWidget {
  const HappinessCardItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List giftCardPrices = [
      "1800",
      "1000",
      "500",
      "1500",
      "2000",
      "3000",
      "2500",
    ];
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width * 0.421875,
      child: ListView.builder(
        itemCount: giftCardPrices.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              left: (index == 0) ? 12 : 0,
              right: 12,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    width: width * 0.75,
                    imageUrl:
                        "https://d23ynomj6u3eig.cloudfront.net/sites/default/files/2022-04/happiness%20gift%20card_1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: width * 0.75,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: const [0.25, 1],
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Happiness Gift Card - Treat for Two",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        "₹ " "${giftCardPrices[index]}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 8,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(100, 32),
                        minimumSize: const Size(100, 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                    onPressed: () {},
                    child: Text(
                      "Buy Now!",
                      style: bodyText2,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
