import 'dart:convert';

class Room {
  final int id;
  final String name;
  final int guestCount;
  final String price;
  final String roomSize;
  final bool availability;
  final String image;

  const Room({
    required this.id,
    required this.name,
    required this.guestCount,
    required this.price,
    required this.roomSize,
    required this.availability,
    required this.image,
  });

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      guestCount: map['guest_count'] ?? 0,
      price: map['price'] ?? '',
      roomSize: map['room_size'] ?? '',
      availability: map['availability'] ?? false,
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'guest_count': guestCount,
      'price': price,
      'room_size': roomSize,
      'availiability': availability,
      'image': image,
    };
  }

  factory Room.fromJson(String source) {
    return Room.fromMap(json.decode(source));
  }

  String toJson() {
    return json.encode(toMap());
  }
}
