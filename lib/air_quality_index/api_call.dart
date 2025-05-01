import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'air_quality_model.dart';


class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  AirQualityModel? airQuality;
  bool isLoaded = true;
  var jsonData;

  Future<void> fetchAirQuality() async {
    try {
      //await Future.delayed(Duration(seconds: 0));
      var response = await http.get(Uri.parse(
          'https://api.waqi.info/feed/bangkok/?token=5fbb8f2475edb1ea9eaf94ff3fdcc3607b3c1824'));

      if (response.statusCode == 200) {
        jsonData = jsonDecode(response.body);

        //print(jsonData);

        setState(() {
          airQuality = AirQualityModel.fromJson(jsonData);
          isLoaded = true;
        });
      } else {
        print('Invalid Data');
        setState(() {
          isLoaded = true;
        });
      }
    } catch (e) {
      print('Error: $e');
      isLoaded = true;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAirQuality();
  }

  Color getAirPolutionColor() {
    if (airQuality!.aqi <= 50) {
      return Colors.green;
    } else if (airQuality!.aqi <= 100) {
      return Colors.yellow;
    } else if (airQuality!.aqi <= 150) {
      return Colors.orange;
    } else if (airQuality!.aqi <= 200) {
      return Colors.red;
    } else if (airQuality!.aqi <= 300) {
      return Colors.purple;
    } else if (airQuality!.aqi > 300) {
      return const Color.fromARGB(255, 150, 38, 30);
    }

    return Colors.grey;
  }

  String getAirPolutionText() {
    if (airQuality!.aqi <= 50) {
      return "Good";
    } else if (airQuality!.aqi <= 100) {
      return "Moderate";
    } else if (airQuality!.aqi <= 150) {
      return "Unhealthy for Sensitive Groups";
    } else if (airQuality!.aqi <= 200) {
      return "Unhealthy";
    } else if (airQuality!.aqi <= 300) {
      return "Very Unhealthy";
    } else if (airQuality!.aqi > 300) {
      return "Hazardous";
    }

    return "null";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 245, 215),
      appBar: AppBar(
        title: const Text(
          'Air Quality Index (AQI)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 214, 237, 248),
      ),
      body: isLoaded
          ? airQuality != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 199, 52, 52),
                              size: 30,
                            ),

                            // ทำให้ Text ยืดหยุ่นและขึ้นบรรทัดใหม่ได้
                            Text(
                              "${airQuality!.city}",
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                        const SizedBox(height: 20),
                        Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 50,
                            //alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: getAirPolutionColor(),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: getAirPolutionColor().withOpacity(1),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  height: 50,

                                  /*
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1)),*/
                                  child: const Text(
                                    "AQI",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 150,

                                  /*
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1)),*/
                                  child: Text(
                                    "${airQuality!.aqi}",
                                    style: TextStyle(
                                      fontSize: 120,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      shadows: [
                                        Shadow(
                                          color: Colors.white
                                              .withOpacity(1), // สีเงา
                                          offset:
                                              const Offset(0, 0), // ตำแหน่งเงา
                                          blurRadius: 30, // ความฟุ้งของเงา
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 80,

                                  /*
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1)),*/
                                  child: Text(
                                    getAirPolutionText(),
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 30),
                        Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width - 50,
                            //alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 119, 181, 219),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 119, 181, 219)
                                          .withOpacity(1), // สีเงา
                                  blurRadius: 10, // ความเบลอของเงา
                                  spreadRadius: 2, // การกระจายของเงา
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 25),
                                      /*decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),*/
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.cloud,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Temperature",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 232, 244, 255)),
                                          ),
                                        ],
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 18),
                                    /*decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1)),*/
                                    child: Text(
                                      "${airQuality!.temperature}°",
                                      style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 47, 84, 115),
                                        shadows: [
                                          Shadow(
                                            color: const Color.fromARGB(
                                                    255, 255, 255, 255)
                                                .withOpacity(1), // สีเงา
                                            //offset: Offset(0, 0), // ตำแหน่งเงา
                                            blurRadius: 20, // ความฟุ้งของเงา
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 40),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isLoaded = false;
                              });
                              fetchAirQuality();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 187, 226, 199),
                              foregroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              minimumSize: const Size(100, 60),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.refresh),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Refresh",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            )),
                      ],
                    )
                  ],
                )
              : const Center(child: Text("No Data"))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}