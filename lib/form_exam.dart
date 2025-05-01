import 'package:flutter/material.dart';

class FormExam extends StatefulWidget {
  const FormExam({super.key});

  @override
  State<FormExam> createState() => _FormExamState();
}

class _FormExamState extends State<FormExam> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _scoreController = TextEditingController();
  String _result = '';

  void _calculateGrade() {
    if (_formKey.currentState!.validate()) {
      double score = double.parse(_scoreController.text);
      String grade;

      if (score >= 80) {
        grade = 'A';
      } else if (score >= 70) {
        grade = 'B';
      } else if (score >= 60) {
        grade = 'C';
      } else if (score >= 50) {
        grade = 'D';
      } else {
        grade = 'F';
      }

      setState(() {
        _result = 'คะแนน: $score\nเกรด: $grade';
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
                controller: _scoreController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Enter Score'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a score';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateGrade,
                child: const Text('Calculate Grade'),
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
