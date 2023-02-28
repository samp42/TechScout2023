import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class ResultsFormState extends State<ResultsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //   return Form(
    //       key: _formKey,
    //       child: Row(
    //         children: [
    //           TextFormField(
    //             decoration: const InputDecoration(
    //               border: OutlineInputBorder(),
    //               fillColor: redPrimary,
    //               hintText: 'Red Score',
    //             ),
    //           ),
    //           TextFormField(
    //             decoration: const InputDecoration(
    //               border: OutlineInputBorder(),
    //               fillColor: bluePrimary,
    //               hintText: 'Blue Score',
    //             ),
    //           ),
    //         ],
    //       ));
    return Container();
  }
}

class ResultsForm extends StatefulWidget {
  const ResultsForm({Key? key}) : super(key: key);

  @override
  ResultsFormState createState() => ResultsFormState();
}
