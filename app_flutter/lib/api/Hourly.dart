// import 'Rain.dart';
// import 'Weather.dart';
//
// class Hourly {
//     int clouds;
//     double dew_point;
//     int dt;
//     double feels_like;
//     int humidity;
//     double pop;
//     int pressure;
//     Rain rain;
//     double temp;
//     double uvi;
//     int visibility;
//     List<Weather> weather;
//     int wind_deg;
//     double wind_gust;
//     double wind_speed;
//
//     Hourly({required this.clouds, required this.dew_point, required this.dt, required this.feels_like, required this.humidity, required this.pop, required this.pressure, required this.rain, required this.temp, required this.uvi, required this.visibility, required this.weather, required this.wind_deg, required this.wind_gust, required this.wind_speed});
//
//     factory Hourly.fromJson(Map<String, dynamic> json) {
//         return Hourly(
//             clouds: json['clouds'],
//             dew_point: json['dew_point'],
//             dt: json['dt'],
//             feels_like: json['feels_like'],
//             humidity: json['humidity'],
//             pop: json['pop'],
//             pressure: json['pressure'],
//             rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
//             temp: json['temp'],
//             uvi: json['uvi'],
//             visibility: json['visibility'],
//             weather: json['weather'] != null ? (json['weather'] as List).map((i) => Weather.fromJson(i)).toList() : null,
//             wind_deg: json['wind_deg'],
//             wind_gust: json['wind_gust'],
//             wind_speed: json['wind_speed'],
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['clouds'] = this.clouds;
//         data['dew_point'] = this.dew_point;
//         data['dt'] = this.dt;
//         data['feels_like'] = this.feels_like;
//         data['humidity'] = this.humidity;
//         data['pop'] = this.pop;
//         data['pressure'] = this.pressure;
//         data['temp'] = this.temp;
//         data['uvi'] = this.uvi;
//         data['visibility'] = this.visibility;
//         data['wind_deg'] = this.wind_deg;
//         data['wind_gust'] = this.wind_gust;
//         data['wind_speed'] = this.wind_speed;
//         if (this.rain != null) {
//             data['rain'] = this.rain.toJson();
//         }
//         if (this.weather != null) {
//             data['weather'] = this.weather.map((v) => v.toJson()).toList();
//         }
//         return data;
//     }
// }