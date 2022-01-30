// import 'Current.dart';
// import 'Daily.dart';
// import 'Hourly.dart';
// import 'Minutely.dart';
//
// class api {
//     Current current;
//     List<Daily> daily;
//     List<Hourly> hourly;
//     double lat;
//     double lon;
//     List<Minutely> minutely;
//     String timezone;
//     int timezone_offset;
//
//     api({required this.current, required this.daily, required this.hourly, required this.lat, required this.lon, required this.minutely, required this.timezone, required this.timezone_offset});
//
//     factory api.fromJson(Map<String, dynamic> json) {
//         return api(
//             current: json['current'] != null ? Current.fromJson(json['current']) : null,
//             daily: json['daily'] != null ? (json['daily'] as List).map((i) => Daily.fromJson(i)).toList() : null,
//             hourly: json['hourly'] != null ? (json['hourly'] as List).map((i) => Hourly.fromJson(i)).toList() : null,
//             lat: json['lat'],
//             lon: json['lon'],
//             minutely: json['minutely'] != null ? (json['minutely'] as List).map((i) => Minutely.fromJson(i)).toList() : null,
//             timezone: json['timezone'],
//             timezone_offset: json['timezone_offset'],
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['lat'] = this.lat;
//         data['lon'] = this.lon;
//         data['timezone'] = this.timezone;
//         data['timezone_offset'] = this.timezone_offset;
//         if (this.current != null) {
//             data['current'] = this.current.toJson();
//         }
//         if (this.daily != null) {
//             data['daily'] = this.daily.map((v) => v.toJson()).toList();
//         }
//         if (this.hourly != null) {
//             data['hourly'] = this.hourly.map((v) => v.toJson()).toList();
//         }
//         if (this.minutely != null) {
//             data['minutely'] = this.minutely.map((v) => v.toJson()).toList();
//         }
//         return data;
//     }
// }