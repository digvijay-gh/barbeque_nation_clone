import 'package:bbqnation_clone/common_widget.dart';
import 'package:bbqnation_clone/theme.dart';
import 'package:flutter/material.dart';

class TrendingTitleAndItems extends StatelessWidget {
  const TrendingTitleAndItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            TitleWidget(title: "Trending"),
            Icon(Icons.trending_up, color: Colors.deepOrange)
          ],
        ),
        const LeaveSpaceWidget(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            TrendingItem(
              title: "UBQ",
              description: "by barbequenation",
            ),
            TrendingItem(
              title: "5%",
              description: "cashback",
            ),
            TrendingItem(
              title: "Table",
              description: "Reservation",
            ),
          ],
        )
      ],
    );
  }
}

class TrendingItem extends StatelessWidget {
  const TrendingItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height / 10,
          width: height / 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height / 10),
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: const Offset(0, 10),
                blurStyle: BlurStyle.normal,
                spreadRadius: -5,
              ),
            ],
          ),
        ),
        const LeaveSpaceWidget(12),
        Text(
          title,
          style: boldOrangeText.copyWith(fontSize: 12),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 9,
            color: Colors.deepOrange,
          ),
        )
      ],
    );
  }
}
