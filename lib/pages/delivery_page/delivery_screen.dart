import 'package:bbqnation_clone/common_widget.dart';
import 'package:bbqnation_clone/pages/delivery_page/list_items.dart';
import 'package:bbqnation_clone/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'grid_items.dart';
import 'introducing_widget.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.corporate_fare,
            color: Color(0xff707070), size: 28),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Your Location",
              style: TextStyle(color: Color(0xff878787), fontSize: 12),
            ),
            Text(
              "Lucknow",
              style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.circle_grid_3x3_fill,
              color: myOrange,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DeliveryOrTakeawayWidget(),
              LeaveSpaceWidget(16),
              DeliveryScreenOffer(),
              LeaveSpaceWidget(12),
              IntroducingWidget(),
              LeaveSpaceWidget(12),
              GridWithTitle(),
              LeaveSpaceWidget(12),
              ListWithTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryScreenOffer extends StatelessWidget {
  const DeliveryScreenOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List deliveryOfferUrl = [
      "https://d23ynomj6u3eig.cloudfront.net/sites/default/files/2022-08/teaser%20banner%20290x346_%20Biryani%20%26%20Shake%2099_0.png",
      "https://d23ynomj6u3eig.cloudfront.net/sites/default/files/2022-01/teaser%20banner%20290x346%20eat%20drink%20repeat-min%20%284%29.png",
    ];
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: deliveryOfferUrl.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(4),
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: deliveryOfferUrl[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DeliveryOrTakeawayWidget extends StatefulWidget {
  const DeliveryOrTakeawayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DeliveryOrTakeawayWidget> createState() =>
      _DeliveryOrTakeawayWidgetState();
}

class _DeliveryOrTakeawayWidgetState extends State<DeliveryOrTakeawayWidget> {
  bool isDelivery = true;
  bool isTakeaway = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundImage: CachedNetworkImageProvider(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyY7dy5y_AlTMRD4-KYNzdt0Uwh8G5glDdlg&usqp=CAU"),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("UBQ by Barbeque Nation",
                  style: boldOrangeText.copyWith(fontSize: 13)),
              Text("Rampur Garden",
                  style: boldOrangeText.copyWith(fontSize: 11)),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 150,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor:
                              isDelivery ? myOrange : Colors.transparent,
                          fixedSize: const Size.fromWidth(75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isDelivery = true;
                            isTakeaway = false;
                          });
                        },
                        child: Text(
                          "Delivery",
                          style: TextStyle(
                            fontSize: 9,
                            color: isDelivery ? Colors.white : myOrange,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor:
                                isTakeaway ? myOrange : Colors.transparent,
                            fixedSize: const Size.fromWidth(75),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          setState(() {
                            isDelivery = false;
                            isTakeaway = true;
                          });
                        },
                        child: Text(
                          "Takeaway",
                          style: TextStyle(
                              fontSize: 9,
                              color: isTakeaway ? Colors.white : myOrange),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
