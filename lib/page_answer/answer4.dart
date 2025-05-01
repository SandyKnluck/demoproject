import 'package:flutter/material.dart';

class Answer4 extends StatefulWidget {
  const Answer4({super.key});

  @override
  State<Answer4> createState() => _Answer4State();
}

class _Answer4State extends State<Answer4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
              height: 170,
              width: double.infinity,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const Text(
                    'Kanhokluck Nimnaul',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
            child: const Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Text('nimnaul_k@silpakorn.edu'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: const Row(
              children: [
                Icon(Icons.phone, color: Colors.blue),
                SizedBox(width: 8),
                Text('096-881-5526'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: const Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 8),
                Text('413 Uaieiei Street'),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('EditProfile'),
              ),
              const SizedBox(
                width: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Logout'),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}