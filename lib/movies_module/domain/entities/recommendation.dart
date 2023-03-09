import 'package:equatable/equatable.dart';

class MovieRecommendation extends Equatable {
  final int id;
  final String backdropPath;

  const MovieRecommendation({
    required this.id,
    required this.backdropPath,
  });

  @override
  List<Object> get props => [id, backdropPath];
}
