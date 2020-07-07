class PostModel {
  final String id;
  final String description;
  final String altDescription;
  final ImageUrl urls;

  PostModel({this.id, this.description, this.altDescription, this.urls});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'],
        description: json['description'],
        altDescription: json['alt_description'],
        urls: ImageUrl.fromJson(json['urls']),
      );
}

class ImageUrl {
  final String url;

  ImageUrl({this.url});

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      ImageUrl(url: json['raw']);
}
