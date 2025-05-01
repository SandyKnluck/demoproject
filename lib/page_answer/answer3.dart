import 'package:flutter/material.dart';

class Answer3 extends StatefulWidget {
  const Answer3({super.key});

  @override
  State<Answer3> createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Layout'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              color: const Color.fromARGB(255, 216, 216, 216),
              height: 50,
              width: 200,
              alignment: Alignment.center,
              child: const Text(
                'Category: Electronics',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Image.network(
                      "https://www.jib.co.th/img_master/product/original/20240710115539_68770_23_1.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const Text("Laptop",
                      style: TextStyle(
                        fontSize: 16, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ตัวหนา
                      )),
                  const Text("999 THB",
                      style: TextStyle(
                          fontSize: 16, // ขนาดตัวอักษร
                          fontWeight: FontWeight.normal,
                          color: Colors.green // ตัวหนา
                          ))
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Image.network(
                      "https://www.istudio.store/cdn/shop/files/iPhone_16_Pro_Desert_Titanium_TH_1.jpg?v=1725929129",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const Text("Smartphone",
                      style: TextStyle(
                        fontSize: 16, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ตัวหนา
                      )),
                  const Text("699 THB",
                      style: TextStyle(
                          fontSize: 16, // ขนาดตัวอักษร
                          fontWeight: FontWeight.normal,
                          color: Colors.green // ตัวหนา
                          ))
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Image.network(
                      "https://img.advice.co.th/images_nas/pic_product4/A0155056/A0155056_1.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const Text("Tablet",
                      style: TextStyle(
                        fontSize: 16, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ตัวหนา
                      )),
                  const Text("499 THB",
                      style: TextStyle(
                          fontSize: 16, // ขนาดตัวอักษร
                          fontWeight: FontWeight.normal,
                          color: Colors.green // ตัวหนา
                          ))
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Image.network(
                      "https://cdn.supercommerce.io/kareem/uploads/1603796831_1558260-1649788878.jpg",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const Text("Camera",
                      style: TextStyle(
                        fontSize: 16, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ตัวหนา
                      )),
                  const Text("299 THB",
                      style: TextStyle(
                          fontSize: 16, // ขนาดตัวอักษร
                          fontWeight: FontWeight.normal,
                          color: Colors.green // ตัวหนา
                          ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}