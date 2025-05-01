import 'package:flutter/material.dart';

class AnimateOpacityTest extends StatefulWidget {
  const AnimateOpacityTest({super.key});

  @override
  State<AnimateOpacityTest> createState() => _AnimateOpacityTestState();
}

class _AnimateOpacityTestState extends State<AnimateOpacityTest> {
  double _opacity = 1.0;

  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.2 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _opacity,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _toggleOpacity,
            child: const Text('Toggle Opacity'),
          ),
        ],
      )),
    );
  }
}
