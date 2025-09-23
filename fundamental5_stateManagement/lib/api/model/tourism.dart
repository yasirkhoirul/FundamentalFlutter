class Tourism {
  final int id;
  final String name;
  final String description;
  final String address;
  final double longitude;
  final double latitude;
  final int like;
  final String image;

  Tourism({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.like,
    required this.image,
  });
  //factory digunakan agar instance kelas menggunakan yang lama tidak ada instance lagi
  factory Tourism.fromJson(Map<String, dynamic> json) {
    return Tourism(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        address: json['address'],
        longitude: json['longtitude'],
        latitude: json['latitude'],
        like: json['like'],
        image: json['image']);
  }
}

class Tourismlist {
  final bool error;
  final String message;
  final double count;
  final List<Tourism> place;

  Tourismlist(
      {required this.error,
      required this.message,
      required this.count,
      required this.place});

  factory Tourismlist.fromJson(Map<String, dynamic> json) {
    return Tourismlist(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        place: json['place'] != null
            ? List<Tourism>.from(
                json["place"]!.map((data) => Tourism.fromJson(data)))
            : <Tourism>[]);
  }
}

