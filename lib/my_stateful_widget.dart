import 'package:flutter/material.dart';

class MyStatefullWidget extends StatefulWidget {
  const MyStatefullWidget({super.key});

  @override
  State<MyStatefullWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyStatefullWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StatefullWidget'),
          backgroundColor: const Color.fromARGB(255, 251, 210, 241),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Counter Value",
                style: const TextStyle(
                    fontSize: 22, color: Color.fromARGB(255, 88, 163, 224)),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "$counter",
                style: const TextStyle(
                    fontSize: 40, color: Color.fromARGB(255, 88, 163, 224)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: const Color.fromARGB(255, 106, 214, 117),
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (counter > 0) {
                            counter--;
                          }
                        });
                      },
                      
                      child: const Icon(
                        Icons.remove,
                        color: Color.fromARGB(255, 189, 73, 73),
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}