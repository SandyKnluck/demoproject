import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Post'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment
                .center, // จัดข้อความกับวงกลมให้อยู่ในแนวเดียวกัน
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 10, 10),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Kanhokluck Nimnaul",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "5 minutes ago",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ])
            ],
          ),
          // องค์ประกอบอื่นใน Column (ถ้ามี)
          Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.blueGrey,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Like'),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Comment'),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Share'),
              ),
            ],
          )
        ],
      ),
    );
  }
}