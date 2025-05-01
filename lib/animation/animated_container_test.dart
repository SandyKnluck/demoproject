import 'package:flutter/material.dart';

class AnimatedContainerTest extends StatefulWidget {
  const AnimatedContainerTest({
    super.key,
  });

  @override
  State<AnimatedContainerTest> createState() => _AnimatedContainerTestState();
}

class _AnimatedContainerTestState extends State<AnimatedContainerTest> {
  double _size = 100;
  Color _color = Colors.blue;

  void _changeBox() {
    setState(() {
      _size = _size == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1), // ระยะเวลาของ Animation
            curve: Curves.easeInOut, // รูปแบบการเคลื8อนไหว
            width: _size, //เปลี8ยนขนาดความกว้าง
            height: _size, //เปลี8ยนขนาดสูง
            color: _color, //เปลี8ยนสี
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _changeBox,
            child: const Text('Animate Box'),
          ),
        ],
      ),
    ));
  }
}
