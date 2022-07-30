import 'dart:convert';

class Blog {
  final int id;
  final String title;
  final String description;
  final String image;
  final String created;
  final String updated;

  const Blog({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.created,
    required this.updated,
  });

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      created: map['created'] ?? '',
      updated: map['updated'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'created': created,
      'updated': updated,
    };
  }

  factory Blog.fromJson(String source) {
    return Blog.fromMap(json.decode(source));
  }

  String toJson() {
    return json.encode(toMap());
  }
}
