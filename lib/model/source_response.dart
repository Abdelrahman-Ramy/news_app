class SourceResponse {
  String status;
  List<Source> sources
}

class Source{
  String id;
  String name;
  String description;
  String url;
  String language;
  String country;
  String category;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.language,
    required this.category,
    required this.country,
  });

  Source.fromJson(Map<String, dynamic> json):
}
