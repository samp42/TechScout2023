import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class ResultsForm extends StatefulWidget {
  const ResultsForm({Key? key}) : super(key: key);

  @override
  ResultsFormState createState() => ResultsFormState();
}

class ResultsFormState extends State<ResultsForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            color: Colors.amber,
            child: const Text('Amber'),
          ),
          Container(
            color: Colors.red,
            child: const Text('Red'),
          ),
          Container(
            color: Colors.blue,
            child: const Text('Blue'),
          ),
          Container(
            color: Colors.green,
            child: const Text('Green'),
          ),
        ],
      ),
    );
  }
}

// Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                 alignment: Alignment.topRight,
//                 decoration: BoxDecoration(
//                   color: redSecondary,
//                   border: Border.all(color: redSecondary),
//                   borderRadius:
//                       const BorderRadius.only(topLeft: Radius.circular(4)),
//                 ),
//                 child: const TextField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     fillColor: redPrimary,
//                     filled: true,
//                     // no border
//                     border: InputBorder.none,
//                     hintText: 'Red',
//                     hintStyle: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     constraints: BoxConstraints(maxWidth: 120),
//                   ),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 alignment: Alignment.topLeft,
//                 decoration: BoxDecoration(
//                   color: blueSecondary,
//                   border: Border.all(color: blueSecondary),
//                   borderRadius:
//                       const BorderRadius.only(topRight: Radius.circular(4)),
//                 ),
//                 child: const TextField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     fillColor: bluePrimary,
//                     filled: true,
//                     // no border
//                     border: InputBorder.none,
//                     hintText: 'Blue',
//                     hintStyle: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     constraints: BoxConstraints(maxWidth: 120),
//                   ),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                 color: redSecondary,
//                 child: Text('Red'),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 color: whiteT4K,
//                 child: Text('White'),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 color: blueSecondary,
//                 child: Text('Blue'),
//               ),
//             )
//           ],
//         ),
//       ],
//     )