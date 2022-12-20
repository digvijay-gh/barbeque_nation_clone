import 'package:bbqnation_clone/common_widget.dart';
import 'package:bbqnation_clone/pages/reservation_page/offer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'happinesscard_widget.dart';
import 'reserve_table_widget.dart';
import 'trending_items_widgets.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.corporate_fare,
          color: Color(0xff707070),
          size: 28,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Your Location",
              style: TextStyle(
                color: Color(0xff878787),
                fontSize: 12,
              ),
            ),
            Text(
              "Lucknow",
              style: TextStyle(
                color: Color(0xff707070),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell_solid,
              color: myOrange,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.circle_grid_3x3_fill,
              color: myOrange,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const LeaveSpaceWidget(8),
            const HeyAndSmilesCountRow(),
            const LeaveSpaceWidget(12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    OfferCarouselWithIndicator(),
                    LeaveSpaceWidget(12),
                    TrendingTitleAndItems(),
                    LeaveSpaceWidget(16),
                    HappinesCardWidget(),
                    LeaveSpaceWidget(8),
                    ReserveTableWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Widget that contains hey(name) and smiles count
class HeyAndSmilesCountRow extends StatelessWidget {
  const HeyAndSmilesCountRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Hey Digvijay,",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: const [
              Text(
                "Smiles",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "0",
                style: TextStyle(
                  color: myOrange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
