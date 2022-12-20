import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OfferCarouselWithIndicator extends StatefulWidget {
  const OfferCarouselWithIndicator({
    Key? key,
  }) : super(key: key);

  @override
  State<OfferCarouselWithIndicator> createState() =>
      _OfferCarouselWithIndicatorState();
}

class _OfferCarouselWithIndicatorState
    extends State<OfferCarouselWithIndicator> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padEnds: false,
            controller: PageController(viewportFraction: 0.9),
            //allowImplicitScrolling: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://d23ynomj6u3eig.cloudfront.net/sites/default/files/2022-06/hero%20banner%20810x490_%20Mango%20mania.jpg",
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            color: myOrange, value: downloadProgress.progress),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(4, (index) {
              return Container(
                margin: const EdgeInsets.all(4),
                width: _selectedIndex == index ? 28 : 8,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              );
            })
          ],
        ),
      ],
    );
  }
}
