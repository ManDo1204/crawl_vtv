
class VTVNew {
  String original_id;
  String original_url;
  String title;
  String author;
  String avatar;
  String avatar_desc;
  String sapo;
  String content;
  String scraped_time;

  VTVNew({
    required this.original_id,
    required this.original_url,
    required this.title,
    required this.author,
    required this.avatar,
    required this.avatar_desc,
    required this.sapo,
    required this.content,
    required this.scraped_time,
});

  factory VTVNew.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'original_id': String? original_id,
        'original_url': String? original_url,
        'title': String? title,
        'author': String? author,
        'avatar': String? avatar,
        'avatar_desc': String? avatar_desc,
        'sapo': String? sapo,
        'content': String? content,
        'scraped_time': String? scraped_time,
      } =>
        VTVNew(
          original_id: original_id ?? '',
          original_url: original_url ?? '',
          title: title ?? '',
          author: author ?? '',
          avatar: avatar ?? '',
          avatar_desc: avatar_desc ?? '',
          sapo: sapo ?? '',
          content: content ?? '',
          scraped_time: scraped_time ?? ''
        ),
      _ => throw const FormatException('Failed to parse news.'),
    };
  }

}