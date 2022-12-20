import 'package:bbqnation_clone/constants.dart';
import 'package:bbqnation_clone/pages/reservation_page/reservationscreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart_page/cart_screen.dart';
import 'delivery_page/delivery_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavBarIndex = 0;
  List screens = [
    const ReservationScreen(),
    const CartScreen(),
    const DeliveryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_bottomNavBarIndex],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _bottomNavBarIndex,
      selectedItemColor: myOrange,
      onTap: (index) {
        setState(() {
          _bottomNavBarIndex = index;
        });
      },
      items: [
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.group_solid),
          label: "Reservation",
        ),
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bag_fill),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: CachedNetworkImage(
            imageUrl: barbequeIconUrl,
            width: 24,
            height: 24,
            color: Colors.grey.shade700,
          ),
          label: "Delivery/Takeway",
          activeIcon: CachedNetworkImage(
            imageUrl: barbequeIconUrl,
            width: 24,
            height: 24,
            color: myOrange,
          ),
        ),
      ],
    );
  }
}
