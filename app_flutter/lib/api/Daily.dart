// import 'FeelsLike.dart';
// import 'Temp.dart';
//
// class Daily {
//     int clouds;
//     double dew_point;
//     int dt;
//     FeelsLike feels_like;
//     int humidity;
//     double moon_phase;
//     int moonrise;
//     int moonset;
//     double pop;
//     int pressure;
//     double rain;
//     int sunrise;
//     int sunset;
//     Temp temp;
//     int uvi;
//     int wind_deg;
//     double wind_gust;
//     double wind_speed;
//
//     Daily({required this.clouds, required this.dew_point, required this.dt, this.feels_like, required this.humidity, required this.moon_phase, required this.moonrise, required this.moonset, required this.pop, required this.pressure, required this.rain, required this.sunrise, required this.sunset, this.temp, required this.uvi, required this.weather, required this.wind_deg, required this.wind_gust, required this.wind_speed});
//
//     factory Daily.fromJson(Map<String, dynamic> json) {
//         return Daily(
//             clouds: json['clouds'],
//             dew_point: json['dew_point'],
//             dt: json['dt'],
//             feels_like: json['feels_like'] != null ? FeelsLike.fromJson(json['feels_like']) : null,
//             humidity: json['humidity'],
//             moon_phase: json['moon_phase'],
//             moonrise: json['moonrise'],
//             moonset: json['moonset'],
//             pop: json['pop'],
//             pressure: json['pressure'],
//             rain: json['rain'],
//             sunrise: json['sunrise'],
//             sunset: json['sunset'],
//             temp: json['temp'] != null ? Temp.fromJson(json['temp']) : null,
//             uvi: json['uvi'],
//             weather: json['weather'] != null ? (json['weather'] as List).map((i) => WeatherX.fromJson(i)).toList() : null,
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
//         data['humidity'] = this.humidity;
//         data['moon_phase'] = this.moon_phase;
//         data['moonrise'] = this.moonrise;
//         data['moonset'] = this.moonset;
//         data['pop'] = this.pop;
//         data['pressure'] = this.pressure;
//         data['rain'] = this.rain;
//         data['sunrise'] = this.sunrise;
//         data['sunset'] = this.sunset;
//         data['uvi'] = this.uvi;
//         data['wind_deg'] = this.wind_deg;
//         data['wind_gust'] = this.wind_gust;
//         data['wind_speed'] = this.wind_speed;
//         if (this.feels_like != null) {
//             data['feels_like'] = this.feels_like.toJson();
//         }
//         if (this.temp != null) {
//             data['temp'] = this.temp.toJson();
//         }
//         if (this.weather != null) {
//             data['weather'] = this.weather.map((v) => v.toJson()).toList();
//         }
//         return data;
//     }
// }