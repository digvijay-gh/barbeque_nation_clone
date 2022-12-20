// import 'package:enhance_stepper/enhance_stepper.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   int groupValue = 0;
  
//   StepperType _type = StepperType.vertical;

//   List<Tuple2> tuples = [
//     Tuple2(Icons.directions_bike, StepState.indexed, ),
//     Tuple2(Icons.directions_bus, StepState.editing, ),
//     Tuple2(Icons.directions_railway, StepState.complete, ),
//     Tuple2(Icons.directions_boat, StepState.disabled, ),
//     Tuple2(Icons.directions_car, StepState.error, ),
//   ];

//   int _index = 0;

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           TextButton(onPressed: (){
//             ddlog("change");
//             setState(() {
//               _type = _type == StepperType.vertical ? StepperType.horizontal : StepperType.vertical;
//             });
//           }, child: Icon(Icons.change_circle_outlined, color: Colors.white,)),
//         ],
//       ),
//       body: buildStepperCustom(context),
//     );
//   }

//   void go(int index) {
//     if (index == -1 && _index <= 0 ) {
//       ddlog("it's first Step!");
//       return;
//     }

//     if (index == 1 && _index >= tuples.length - 1) {
//       ddlog("it's last Step!");
//       return;
//     }

//     setState(() {
//       _index += index;
//     });
//   }

//   Widget buildStepperCustom(BuildContext context) {
//     return EnhanceStepper(
//         stepIconSize: 30,
//         type: _type,
//         horizontalTitlePosition: HorizontalTitlePosition.bottom,
//         horizontalLinePosition: HorizontalLinePosition.top,
//         currentStep: _index,
//         physics: ClampingScrollPhysics(),
//         steps: tuples.map((e) => EnhanceStep(
//           icon: Icon(e.item1, color: Colors.blue, size: 30,),
//           state: StepState.values[tuples.indexOf(e)],
//           isActive: _index == tuples.indexOf(e),
//           title: Text("step ${tuples.indexOf(e)}"),
//           subtitle: Text("${e.item2.toString().split(".").last}",),
//           content: Text("Content for Step ${tuples.indexOf(e)}"),
//         )).toList(),
//         onStepCancel: () {
//           go(-1);
//         },
//         onStepContinue: () {
//           go(1);
//         },
//         onStepTapped: (index) {
//           ddlog(index);
//           setState(() {
//             _index = index;
//           });
//         },
//         controlsBuilder: (BuildContext context, { VoidCallback? onStepContinue, VoidCallback? onStepCancel }){
//           return Row(
//             children: [
//               SizedBox(height: 30,),
//               ElevatedButton(
//                 onPressed: onStepContinue,
//                 child: Text("Next"),
//               ),
//               SizedBox(width: 8,),
//               TextButton(
//                 onPressed: onStepCancel, 
//                 child: Text("Back"), 
//               ),
//             ],
//           );
//         }
//     );
//   }
// }