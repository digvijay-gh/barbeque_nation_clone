import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class LeaveSpaceWidget extends StatelessWidget {
  final double height;
  const LeaveSpaceWidget(
    this.height, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class TitleWidget extends StatelessWidget {
  final TextStyle style;
  final String title;
  final double fontsize;
  const TitleWidget({
    Key? key,
    required this.title,
    this.fontsize = 14,
    this.style = const TextStyle(
      color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
    ),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        title,
        style: style.copyWith(fontSize: fontsize),
      ),
    );
  }
}

Widget vegOrNonVeg(bool vegmark) {
  if (vegmark == false) {
    return const Icon(CupertinoIcons.arrowtriangle_up_square,
        color: Color(0xff800000));
  } else {
    return const Icon(CupertinoIcons.dot_square, color: Colors.green);
  }
}

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(60, 36),
        minimumSize: const Size(60, 36),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: myOrange,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: const Text(
        "ADD",
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
