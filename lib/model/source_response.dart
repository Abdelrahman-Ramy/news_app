class SourceResponse {
  String? status;
  List<Source>? sources;
  String? code;
  String? message;

  SourceResponse({this.status, this.sources, this.code, this.message});

   /// class ==> object ==> named constructor
   /// object from json
  // json(API) => object(Dart)
  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status']; // json['status'](json) ==> status(object) RTL
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = <Source>[];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

  // object(Dart) => json(API)
  Map<String, dynamic> toJson() {
    // Object  → JSON (Map)
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['url'] = url;
    map['category'] = category;
    map['language'] = language;
    map['country'] = country;
    return map;
  }
}
