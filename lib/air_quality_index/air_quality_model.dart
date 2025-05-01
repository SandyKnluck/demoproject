class AirQualityModel {
  final int aqi;
  final String city;
  final double temperature;

  AirQualityModel(
      {required this.aqi, required this.city, required this.temperature});

  AirQualityModel.fromJson(Map<String, dynamic> json)
      : aqi = json['data']['aqi'],
        city = json['data']['city']['name'],
        temperature = json['data']['iaqi']['t']['v'];

  // ฟังก์ชันแปลงข้อมูล JSON ไปเป็นโมเดล
  Map<String, dynamic> toJson() {
    return {
      'aqi': aqi,
      'city': city,
      'temperature': temperature,
    };
  }
}