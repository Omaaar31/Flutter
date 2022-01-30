// class FeelsLike {
//     double day;
//     double eve;
//     double morn;
//     double night;
//
//     FeelsLike({required this.day, required this.eve, required this.morn, required this.night});
//
//     factory FeelsLike.fromJson(Map<String, dynamic> json) {
//         return FeelsLike(
//             day: json['day'],
//             eve: json['eve'],
//             morn: json['morn'],
//             night: json['night'],
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//         data['day'] = this.day;
//         data['eve'] = this.eve;
//         data['morn'] = this.morn;
//         data['night'] = this.night;
//         return data;
//     }
// }