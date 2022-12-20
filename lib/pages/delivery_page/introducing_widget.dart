import 'package:another_stepper/another_stepper.dart';
import 'package:bbqnation_clone/common_widget.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class IntroducingWidget extends StatelessWidget {
  const IntroducingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 18,
            child: Container(
              height: 18,
              width: 95,
              color: myOrange,
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            child: Container(
              height: 18,
              width: 95,
              color: Colors.grey.shade700,
              child: const Center(
                child: Text(
                  "INTRODUCING",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "BBQN 'Your Delivery Your Time'.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Now Schedule your favourite Delivery",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 14,
            bottom: 14,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.yellow.shade900,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.zero,
                fixedSize: const Size(104, 26),
                minimumSize: const Size(95, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((context) {
                    return const HowItWorksPopUp();
                  }),
                );
              },
              child: const Text(
                "How it works?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HowItWorksPopUp extends StatelessWidget {
  const HowItWorksPopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "How BBQN Scheduled Delivery Works?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: 28,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              ),
              const LeaveSpaceWidget(8),
              Divider(
                color: Colors.grey.shade700,
              ),
              AnotherStepper(
                  gap: 32,
                  barThickness: 1,
                  stepperList: [
                    StepperData(
                      iconWidget: const Icon(Icons.fastfood_outlined),
                      title: StepperText(
                        "Add your favourite items to cart",
                      ),
                    ),
                    StepperData(
                      iconWidget: const Icon(Icons.calendar_month_outlined),
                      title: StepperText(
                        "Choose your prefered date and time",
                      ),
                    ),
                    StepperData(
                      iconWidget: const Icon(Icons.check_circle_outline),
                      title: StepperText(
                        "Schedule your order",
                      ),
                    ),
                  ],
                  stepperDirection: Axis.vertical)
            ],
          ),
        )
      ],
    );
  }
}
