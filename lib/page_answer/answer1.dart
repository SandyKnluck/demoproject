import 'package:flutter/material.dart';

class Answer1 extends StatefulWidget {
  const Answer1({super.key});

  @override
  State<Answer1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Answer1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Layout'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              color: Colors.green,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: Colors.orange,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              color: Colors.purple,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              color: Colors.yellow,
              height: 100,
              width: 100,
            ),
          ])
        ],
      ),
    );
  }
}