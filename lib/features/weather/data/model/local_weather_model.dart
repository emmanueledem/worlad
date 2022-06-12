const tableWeather = 'weather';

class WeatherFields {
  static final List<String> values = [
    id,
    locationName,
    temperature,
    description,
    time,
    weatherId
  ];

  static const String id = 'id';
  static const String locationName = 'locationName';
  static const String temperature = 'temperature';
  static const String description = 'description';
  static const String time = 'time';
  static const String weatherId = 'weatherId';
}

class LocalWeatherModel {
  final int? id;
  final String? locationName;
  final int? temperature;
  final String? description;
  final String? time;
  final int? weatherId;

  LocalWeatherModel({
    this.id,
   required this.locationName,
   required this.temperature,
   required this.description,
   required this.time,
   required this.weatherId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'locationName': locationName,
      'temperature': temperature,
      'description': description,
      'time': time,
      'weatherId': weatherId,
    };
  }

  LocalWeatherModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        locationName = res["locationName"],
        temperature = res["temperature"],
        description = res["description"],
        time = res['time'],
        weatherId = res['weatherId'];
        
  // @override
  // String toString() {
  //   return 'Note{id: $id, name: $title, description: $description, time: $time, colorCode: $colorCode}';
  // }
}
