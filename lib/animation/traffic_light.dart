import 'dart:async';

import 'package:flutter/material.dart';

class TrafficLight extends StatefulWidget {
  const TrafficLight({super.key});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  int _currentLight = 0; // 0 = แดง, 1 = เหลือง, 2 = เขียว
  int _timeLeft = 20; // เวลานับถอยหลังเริ่มต้นของไฟแดง
  Timer? _timer; // ตัวจับเวลา

  // กำหนดเวลาของแต่ละไฟ (แดง 20 วิ, เหลือง 3 วิ, เขียว 10 วิ)
  final Map<int, int> _lightDurations = {
    0: 20, // แดง
    1: 3, // เหลือง
    2: 10, // เขียว
  };

  void _startTimer() {
    _timer?.cancel(); // ยกเลิก Timer เก่า (ถ้ามี)
    _timeLeft = _lightDurations[_currentLight]!; // ตั้งเวลาตามไฟปัจจุบัน
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _changeLight();
      }
    });
  }

  void initState() {
    super.initState();
    _startTimer();
  }

  void _changeLight() {
    setState(() {
      _currentLight = (_currentLight + 1) % 3;
      _timeLeft = _lightDurations[_currentLight]!;
    });
    _startTimer(); // รีสตาร์ท Timer สำหรับไฟถัดไป
  }

  double _getOpacity(int lightIndex) {
    return _currentLight == lightIndex ? 1.0 : 0.3;
  }

  Color _getBackgroundColor() {
    switch (_currentLight) {
      case 0:
        return Colors.red.shade100; // พื้นหลังสีแดงอ่อน
      case 1:
        return const Color.fromARGB(255, 255, 250, 208); // พื้นหลังสีเหลืองอ่อน
      case 2:
        return Colors.green.shade100; // พื้นหลังสีเขียวอ่อน
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Light Animation'),
      ),
      backgroundColor: _getBackgroundColor(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_timeLeft',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _getOpacity(0),
                child: _buildLight(Colors.red),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _getOpacity(1),
                child: _buildLight(const Color.fromARGB(255, 255, 213, 24)),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _getOpacity(2),
                child: _buildLight(Colors.green),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeLight,
                child: const Text('เปลี่ยนไฟ'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLight(Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}
