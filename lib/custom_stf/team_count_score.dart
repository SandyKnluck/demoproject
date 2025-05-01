import 'package:flutter/material.dart';

import 'custom_counter_widget.dart';

class TeamCountScore extends StatefulWidget {
  const TeamCountScore({super.key});

  @override
  State<TeamCountScore> createState() => _TeamCountScoreState();
}

class _TeamCountScoreState extends State<TeamCountScore> {
  Color winPlayerColor = Colors.white;
  void setWinPlayerColor(Color winColor) {
    setState(() {
      winPlayerColor = winColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: winPlayerColor,
      appBar: AppBar(title: const Text('Custom Widget')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomCounterWidget(
          title: 'Team A',
          backgroundColor: Colors.red,
          onPlayerWin: setWinPlayerColor,
        ),
        const SizedBox(height: 10),
        CustomCounterWidget(
          title: 'Team B',
          backgroundColor: Colors.blue,
          onPlayerWin: setWinPlayerColor,
        ),
      ])),
    );
  }
}
