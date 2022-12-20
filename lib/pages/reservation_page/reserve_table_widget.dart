import 'package:bbqnation_clone/common_widget.dart';
import 'package:bbqnation_clone/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ReserveTableWidget extends StatelessWidget {
  const ReserveTableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TitleWidget(title: "Reserve a Table"),
        ReserveTableCard(),
      ],
    );
  }
}

class ReserveTableCard extends StatelessWidget {
  const ReserveTableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            image: const CachedNetworkImageProvider(
              "https://d23ynomj6u3eig.cloudfront.net/sites/default/files/2019-12/livecounter_3.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    "Rampur Garden",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Info",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomButton(
                    text: "Today",
                  ),
                  CustomButton(
                    text: "Tommorow",
                  ),
                  CustomButton(
                    text: "Pick a Date",
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: myOrange,
          fixedSize: const Size(90, 32),
          minimumSize: const Size(80, 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
