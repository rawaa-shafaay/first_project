class ImageModel {
  final int id;
  final String title;
  final String url;

  const ImageModel(this.id, this.title, this.url);

  ImageModel.fromJason(parsedJson)
      : id = parsedJson['id'],
        title = parsedJson['title'],
        url = parsedJson['url'];
}
