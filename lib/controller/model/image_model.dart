class ImageModel {
  ImageModel(
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  );
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    downloadUrl = json['download_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['author'] = author;
    _data['width'] = width;
    _data['height'] = height;
    _data['url'] = url;
    _data['download_url'] = downloadUrl;
    return _data;
  }
}
