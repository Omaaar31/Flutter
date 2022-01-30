// class Minutely {
//     int dt;
//     int precipitation;
//
//     Minutely({required this.dt, required this.precipitation});
//
//     factory Minutely.fromJson(Map<String, dynamic> json) {
//         return Minutely(
//             dt: json['dt'],
//             precipitation: json['precipitation'],
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['dt'] = this.dt;
//         data['precipitation'] = this.precipitation;
//         return data;
//     }
// }