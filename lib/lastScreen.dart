import 'package:flutter/material.dart';

class SubmitFromPage extends StatefulWidget {
  const SubmitFromPage({Key? key}) : super(key: key);

  @override
  _SubmitFromPageState createState() => _SubmitFromPageState();
}

class _SubmitFromPageState extends State<SubmitFromPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "YOUR FORM ARE SUBMITED\nTHANK YOU FOR VISITING OUR APP",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.red),
        ),
      ),
    );
  }
}