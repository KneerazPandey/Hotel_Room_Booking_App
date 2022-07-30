import 'dart:convert';

class Gallery {
  final int id;
  final String category;
  final String image;

  const Gallery({
    required this.id,
    required this.category,
    required this.image,
  });

  factory Gallery.fromMap(Map<String, dynamic> map) {
    return Gallery(
      id: map['id'] ?? 0,
      category: map['category'] ?? '',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'image': image,
    };
  }

  factory Gallery.fromJson(String source) {
    return Gallery.fromMap(json.decode(source));
  }

  String toJson() {
    return json.encode(toMap());
  }
}
