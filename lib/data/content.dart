class Content {
  String id;
  String title;
  String description;
  String date;
  String thumnailUrl;
  String contentUrl;

  Content(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.thumnailUrl,
      required this.contentUrl});

  factory Content.fromJson(Map<String, dynamic> jsonObject) {
    return Content(
        id: jsonObject['id'],
        title: jsonObject['title'],
        description: jsonObject['description'],
        date: jsonObject['date'],
        thumnailUrl:
            'https://pb.7learn.com/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thubnail_url']}',
        contentUrl:
            'https://pb.7learn.com/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['content_link']}');
  }
}
