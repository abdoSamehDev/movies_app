import 'package:movies_app/movies_module/domain/entities/generes.dart';

class GenresModel extends Genres {
  const GenresModel({
    required super.name,
    required super.id,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      name: json["name"],
      id: json["id"],
    );
  }
}
