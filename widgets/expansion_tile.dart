// import 'package:flutter/material.dart';

// class ExpansionTile extends StatefulWidget {
//   final String title;
//   final int index;
//   final ScrollController controller;

//   ExpansionTile({
//     Key? key,
//     required this.title,
//     required this.index,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   State<ExpansionTile> createState() => _ExpansionTileState();
// }

// class _ExpansionTileState extends State<ExpansionTile> {
//   var isExpanded = false;
//   var readyToShowContent = false;
//   final duration = const Duration(milliseconds: 380);
//   final logoSize = 50;

//   void changeExpansionSize() {
//     if (!isExpanded) {
//       var offset = widget.controller.offset;
//       // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
//       //   widget.controller.animateTo(calculateOffset(offset),
//       //       duration: duration, curve: Curves.ease);
//       // });

//       setState(() {
//         isExpanded = !isExpanded;
//       });
      
//       Future.delayed(duration).then((_) {
//         setState(() {
//           readyToShowContent = !readyToShowContent;
//         });
//       });
//       } else {
//         setState(() {
//           readyToShowContent = !readyToShowContent;
//           isExpanded = !isExpanded;
//         });
//       }
//     }

//     // double calculateOffset(double offset) {
//     //   var newOffset = offset + (60.0 * widget.index - offset);
//     //   return (textLength / 45) * 22;
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//     // AnimatedContainer(
//     //   duration: duration,
//     //   height: isExpanded 
//     //     ? (calculatePercentByTextLength(kLoremipsumz.length)
//     //     : 68),
//     //     padding: ,
//     // );
//   }
// }
