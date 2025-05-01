import 'package:flutter/material.dart';

import 'answer1.dart';
import 'answer2.dart';
import 'answer3.dart';
import 'answer4.dart';

class Answer5 extends StatefulWidget {
  const Answer5({super.key});

  @override
  State<Answer5> createState() => _Answer5State();
}

class _Answer5State extends State<Answer5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Answer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
        ),
        backgroundColor: const Color.fromARGB(255, 201, 235, 238),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Answer1()),
                  );
                },
                child: const Text('Answer1'),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Answer2()),
                );
              },
              child: const Text('Answer2'),
            ),
            const SizedBox(
              height: 3,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Answer3()),
                );
              },
              child: const Text('Answer3'),
            ),
            const SizedBox(
              height: 3,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Answer4()),
                );
              },
              child: const Text('Answer4'),
            ),
          ],
        ));
  }
}