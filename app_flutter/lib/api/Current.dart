// class Current {
//     int clouds;
//     double dew_point;
//     int dt;
//     double feels_like;
//     int humidity;
//     int pressure;
//     int sunrise;
//     int sunset;
//     double temp;
//     double uvi;
//     int visibility;
//     List<Object> weather;
//     int wind_deg;
//     double wind_gust;
//     double wind_speed;
//
//     Current({required this.clouds, required this.dew_point, required this.dt, required this.feels_like, required this.humidity, required this.pressure, required this.sunrise, required this.sunset, required this.temp, required this.uvi, required this.visibility, required this.weather, required this.wind_deg, required this.wind_gust, required this.wind_speed});
//
//     factory Current.fromJson(Map<String, dynamic> json) {
//         return Current(
//             clouds: json['clouds'],
//             dew_point: json['dew_point'],
//             dt: json['dt'],
//             feels_like: json['feels_like'],
//             humidity: json['humidity'],
//             pressure: json['pressure'],
//             sunrise: json['sunrise'],
//             sunset: json['sunset'],
//             temp: json['temp'],
//             uvi: json['uvi'],
//             visibility: json['visibility'],
//             weather: json['weather'] != null ? (json['weather'] as List).map((i) => Object.fromJson(i)).toList() : null,
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
//         data['pressure'] = this.pressure;
//         data['sunrise'] = this.sunrise;
//         data['sunset'] = this.sunset;
//         data['temp'] = this.temp;
//         data['uvi'] = this.uvi;
//         data['visibility'] = this.visibility;
//         data['wind_deg'] = this.wind_deg;
//         data['wind_gust'] = this.wind_gust;
//         data['wind_speed'] = this.wind_speed;
//         if (this.weather != null) {
//             data['weather'] = this.weather.map((v) => v.toJson()).toList();
//         }
//         return data;
//     }
// }