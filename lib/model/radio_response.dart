// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RadioResponse radioResponseFromJson(String str) =>
    RadioResponse.fromJson(json.decode(str));

String radioResponseToJson(RadioResponse data) => json.encode(data.toJson());

class RadioResponse {
  RadioResponse({
    this.radios,
  });

  List<Radios>? radios;

  factory RadioResponse.fromJson(Map<String, dynamic> json) => RadioResponse(
        radios:
            List<Radios>.from(json["radios"].map((x) => Radios.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "radios": List<dynamic>.from(radios!.map((x) => x.toJson())),
      };
}

class Radios {
  Radios({
    this.name,
    this.radioUrl,
  });

  String? name;
  String? radioUrl;

  factory Radios.fromJson(Map<String, dynamic> json) => Radios(
        name: json["name"],
        radioUrl: json["radio_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "radio_url": radioUrl,
      };
}
