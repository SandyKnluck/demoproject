import 'package:flutter/material.dart';

class FormExam2 extends StatefulWidget {
  const FormExam2({super.key});

  @override
  State<FormExam2> createState() => _FormExamState();
}

class _FormExamState extends State<FormExam2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _score1Controller = TextEditingController();
  final TextEditingController _score2Controller = TextEditingController();
  String _result = '';

  void _calculateAverage() {
    if (_formKey.currentState!.validate()) {
      double score1 = double.parse(_score1Controller.text);
      double score2 = double.parse(_score2Controller.text);
      double x = 10;
      double average = (score1 * x) / 2;
      String grade;

      if (average >= 80) {
        grade = 'A';
      } else if (average >= 70) {
        grade = 'B';
      } else if (average >= 60) {
        grade = 'C';
      } else if (average >= 50) {
        grade = 'D';
      } else {
        grade = 'F';
      }

      setState(() {
        _result = 'คะแนนเฉลี่ย: $average\nเกรด: $grade';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _score1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Enter Score 1'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the first score';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _score2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Enter Score 2'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the second score';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateAverage,
                child: const Text('Calculate Average'),
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
